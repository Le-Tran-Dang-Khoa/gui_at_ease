import 'dart:math';
import 'dart:ui';

import '../state/screen_changed_handler_state.dart';

class ScreenCtrl {
  static final instance = ScreenCtrl._singleton();

  ScreenCtrl._singleton({Size designRes = const Size(480.0, 720.0)}) {
    setDesignedRes(designRes);
  }

  double _lastDevicePixelRatio = 0.0;
  Size _lastSize = Size.zero;

  /// Observed list of State
  final List<ScreenChangedHandlerState> _stateHandlers =
      <ScreenChangedHandlerState>[];

  Size _designedRes = Size.zero;
  Size get designedRes => _designedRes;
  Size _safeRefinedDesignedRes = Size.zero;
  Size get safeRefinedDesignedRes => _safeRefinedDesignedRes;
  double _safeScaleFactor = 0.0;
  double get safeScaleFactor => _safeScaleFactor;
  Size _safeLogicalRes = Size.zero;
  Size get safeLogicalRes => _safeLogicalRes;
  Rect _safeLogicalArea = Rect.zero;
  Rect get safeLogicalArea => _safeLogicalArea;

  double toScaledValue(num value) => value * _safeScaleFactor;

  void setDesignedRes(Size newDesignRes) {
    if (_designedRes != newDesignRes) {
      _designedRes = newDesignRes;
      _refresh();
    }
  }

  void refreshMetrics({bool forcedRefresh = false}) {
    if (forcedRefresh ||
        (_lastSize != window.physicalSize) ||
        (_lastDevicePixelRatio != window.devicePixelRatio)) _refresh();
  }

  void regStateHandler(ScreenChangedHandlerState stateHandler) {
    if (!_stateHandlers.contains(stateHandler)) {
      _stateHandlers.add(stateHandler);
    }
  }

  void unregStateHandler(ScreenChangedHandlerState stateHandler) {
    _stateHandlers.remove(stateHandler);
  }

  void cleanAllStateHandler() {
    _stateHandlers.clear();
  }

  void _refresh() {
    _lastDevicePixelRatio = window.devicePixelRatio;
    _lastSize = window.physicalSize;

    var logicalPaddingLeft = window.padding.left / window.devicePixelRatio;
    var logicalPaddingRight = window.padding.right / window.devicePixelRatio;
    var logicalPaddingTop = window.padding.top / window.devicePixelRatio;
    var logicalPaddingBottom = window.padding.bottom / window.devicePixelRatio;
    var logicalRes = _lastSize / window.devicePixelRatio;
    _safeLogicalRes = Size(
      logicalRes.width - logicalPaddingLeft - logicalPaddingRight,
      logicalRes.height - logicalPaddingTop - logicalPaddingBottom,
    );
    double ratioX, ratioY;
    if (((_safeLogicalRes.aspectRatio < 1.0) &&
            (designedRes.aspectRatio < 1.0)) ||
        ((_safeLogicalRes.aspectRatio >= 1.0) &&
            (designedRes.aspectRatio >= 1.0))) {
      ratioX = _safeLogicalRes.width / designedRes.width;
      ratioY = _safeLogicalRes.height / designedRes.height;
    } else {
      ratioX = _safeLogicalRes.width / designedRes.height;
      ratioY = _safeLogicalRes.height / designedRes.width;
    }
    _safeScaleFactor = min(ratioX, ratioY);

    _safeRefinedDesignedRes = _safeLogicalRes * _safeScaleFactor;
    _safeLogicalArea = Rect.fromLTRB(
      logicalPaddingLeft,
      _safeLogicalRes.width,
      logicalPaddingTop,
      _safeLogicalRes.height,
    );

    // Force observed States to update
    for (var stateHandler in _stateHandlers) {
      stateHandler.didChangeScreen();
    }
  }
}
