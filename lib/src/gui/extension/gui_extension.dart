import 'package:flutter/widgets.dart';

import '../../base/extension/base_extension.dart';
import '../../helper/runtime_helper.dart';
import '../ctrl/screen_ctrl.dart';

extension ScreenCtrlOnNum on num {
  /// Convert this to double at ScreenCtrl.instance.safeScaleFactor scale value
  double get as => this * ScreenCtrl.instance.safeScaleFactor;
}

extension ScreenCtrlOnListDouble on List<double> {
  /// Convert each value in this to double at ScreenCtrl.instance.safeScaleFactor scale value
  /// Return the new list of converted value
  List<double> get as => [for (var val in this) val.as];
}

extension ScreenCtrlOnListInt on List<int> {
  /// Convert each value in this to double at ScreenCtrl.instance.safeScaleFactor scale value
  /// Return the new list of converted value
  List<double> get as => [for (var val in this) val.as];
}

extension ScreenCtrlOnWidget on Widget {
  /// Query the screen is Potrait or not
  bool get isScreenPotrait =>
      ScreenCtrl.instance.safeLogicalRes.aspectRatio <= 1.0;

  /// Query safe logicalHeight of the screen
  double get logicalHeight => ScreenCtrl.instance.safeLogicalRes.height;

  /// Query safe logicalWidth of the screen
  double get logicalWidth => ScreenCtrl.instance.safeLogicalRes.width;
}

extension ScreenCtrlOnStatefulWidget on State<StatefulWidget> {
  /// Query the screen is Potrait or not
  bool get isScreenPotrait =>
      ScreenCtrl.instance.safeLogicalRes.aspectRatio <= 1.0;

  /// Query safe logicalHeight of the screen
  double get sLcHeight => ScreenCtrl.instance.safeLogicalRes.height;

  /// Query safe logicalWidth of the screen
  double get sLcWidth => ScreenCtrl.instance.safeLogicalRes.width;
}

extension GuiExtensionOnDouble on double {
  /// Get SizedBox with height is this
  SizedBox szBxVer({Key? key}) => SizedBox(key: key, height: this);

  /// Get SizedBox with height is this and given child of SizedBox
  SizedBox szBxVerWithChild(Widget child, {Key? key}) => SizedBox(
        key: key,
        height: this,
        child: child,
      );

  /// Get SizedBox with width is this
  SizedBox szBxHor({Key? key}) => SizedBox(key: key, width: this);

  /// Get SizedBox with width is this and given child of SizedBox
  SizedBox szBxHorWithChild(Widget child, {Key? key}) => SizedBox(
        key: key,
        width: this,
        child: child,
      );

  /// Get EdgeInsets with all offsets are this
  EdgeInsets get edgInstAll => EdgeInsets.all(this);

  /// Get EdgeInsets with all left and right offsets are this
  EdgeInsets get edgInstLR => EdgeInsets.only(
        left: this,
        right: this,
      );

  /// Get EdgeInsets with all top and bottom offsets are this
  EdgeInsets get edgInstTB => EdgeInsets.only(
        top: this,
        bottom: this,
      );

  /// Get BorderRadius with all radii are this
  BorderRadius get brRdC => BorderRadius.all(Radius.circular(this));
}

extension GuiExtensionOnInt on int {
  /// Get Color from this
  Color get color => Color(this);

  /// Get SizedBox with height is this
  SizedBox szBxVer({Key? key}) => toDouble().szBxVer(key: key);

  /// Get SizedBox with height is this and given child of SizedBox
  SizedBox szBxVerWithChild(Widget child, {Key? key}) =>
      toDouble().szBxVerWithChild(child, key: key);

  /// Get SizedBox with width is this
  SizedBox szBxHor({Key? key}) => toDouble().szBxHor(key: key);

  /// Get SizedBox with width is this and given child of SizedBox
  SizedBox szBxHorWithChild(Widget child, {Key? key}) =>
      toDouble().szBxHorWithChild(child, key: key);

  /// Get EdgeInsets with all offsets are this
  EdgeInsets get edgInstAll => toDouble().edgInstAll;

  /// Get EdgeInsets with all left and right offsets are this
  EdgeInsets get edgInstLR => toDouble().edgInstLR;

  /// Get EdgeInsets with all top and bottom offsets are this
  EdgeInsets get edgInstTB => toDouble().edgInstTB;

  /// Get Expanded with flex is this and give SizeBox as widget child
  Expanded flxExpd({Key? key}) => Expanded(
        key: key,
        flex: this,
        child: const SizedBox(),
      );

  /// Get Expanded with flex is this and given widget child
  Expanded flxExpdWithChild(
    Widget child, {
    Key? key,
  }) =>
      Expanded(
        key: key,
        flex: this,
        child: child,
      );

  /// Get BorderRadius with all radii are this
  BorderRadius get brRdC => toDouble().brRdC;
}

extension GuiExtensionOnListDouble on List<double> {
  /// EdgeInsets.symmetric with vertical and horizontal are items in this (length == 2) by ordering
  EdgeInsets get edgInstSym {
    assert(length == 2);

    return EdgeInsets.symmetric(
      vertical: this[0],
      horizontal: this[1],
    );
  }

  /// Get EdgeInsets with left, top, right and bottom are items in this (length <= 4) by ordering
  EdgeInsets get edgInst {
    assert(length <= 4);
    double left = 0, top = 0, right = 0, bottom = 0;

    if (length <= 0) return EdgeInsets.zero;
    if (length >= 1) left = this[0];
    if (length >= 2) top = this[1];
    if (length >= 3) right = this[2];
    if (length >= 4) bottom = this[3];

    return EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  /// Get SizedBox with width and height are items in this (length == 2) by ordering
  SizedBox szBx({Key? key}) {
    assert(length <= 2);
    double width = 0, height = 0;

    if (length <= 0) return const SizedBox();
    if (length >= 1) width = this[0];
    if (length >= 2) height = this[1];

    return SizedBox(
      key: key,
      width: width,
      height: height,
    );
  }
}

extension GuiExtensionOnListInt on List<int> {
  /// EdgeInsets.symmetric with vertical and horizontal are items in this (length == 2) by ordering
  EdgeInsets get edgInstSym {
    assert(length == 2);
    return toDouble.edgInstSym;
  }

  /// Get EdgeInsets with left, top, right and bottom are items in this (length <= 4) by ordering
  EdgeInsets get edgInst {
    assert(length <= 4);
    return toDouble.edgInst;
  }

  /// Get SizedBox with width and height are items in this (length == 2) by ordering
  SizedBox szBx({Key? key}) {
    assert(length <= 2);
    return toDouble.szBx(key: key);
  }
}

extension GuiExtensionOnState on State {
  /// Query device is Mobile or not
  bool get isMobile => RuntimeHelper.isMobile;

  /// Query device is runnning Android or not
  bool get isAndroid => RuntimeHelper.isAndroid;

  /// Query device is running iOS or not
  bool get isIOS => RuntimeHelper.isIOS;

  /// Query device is Desktop or not
  bool get isDesktop => RuntimeHelper.isDesktop;

  /// Query device is running MacOS or not
  bool get isMacOS => RuntimeHelper.isMacOS;

  /// Query device is running Windows or not
  bool get isWindows => RuntimeHelper.isWindows;

  /// Query device is running Linux or not
  bool get isLinux => RuntimeHelper.isLinux;

  /// Query Flutter is running on Web or not
  bool get isWeb => RuntimeHelper.isWeb;

  /// Query Flutter is running in Release mode or not
  bool get isRelease => RuntimeHelper.isRelease;

  /// Query Flutter is running in Debug mode or not
  bool get isDebug => RuntimeHelper.isDebug;

  /// Wrap given widget by the Expanded with flex specified
  Expanded flxExpdWithChild(
    /// given widget
    Widget child, {
    Key? key,

    /// flex value
    int flex = 1,
  }) =>
      flex.flxExpdWithChild(child, key: key);
}

extension GuiExtensionOnStatelessWidget on Widget {
  /// Query device is Mobile or not
  bool get isMobile => RuntimeHelper.isMobile;

  /// Query device is runnning Android or not
  bool get isAndroid => RuntimeHelper.isAndroid;

  /// Query device is running iOS or not
  bool get isIOS => RuntimeHelper.isIOS;

  /// Query device is Desktop or not
  bool get isDesktop => RuntimeHelper.isDesktop;

  /// Query device is running MacOS or not
  bool get isMacOS => RuntimeHelper.isMacOS;

  /// Query device is running Windows or not
  bool get isWindows => RuntimeHelper.isWindows;

  /// Query device is running Linux or not
  bool get isLinux => RuntimeHelper.isLinux;

  /// Query Flutter is running on Web or not
  bool get isWeb => RuntimeHelper.isWeb;

  /// Query Flutter is running in Release mode or not
  bool get isRelease => RuntimeHelper.isRelease;

  /// Query Flutter is running in Debug mode or not
  bool get isDebug => RuntimeHelper.isDebug;

  /// Wrap this widget by the Expanded with given flex
  Expanded flxExpd(
          {Key? key,

          /// flex value
          int flex = 1}) =>
      flex.flxExpdWithChild(this, key: key);

  /// Wrap this widget by the Align with center
  Widget center({Key? key}) => Align(
        key: key,
        alignment: Alignment.center,
        child: this,
      );

  /// Wrap this widget by the Align with center left
  Widget centerLeft({Key? key}) => Align(
        key: key,
        alignment: Alignment.centerLeft,
        child: this,
      );

  /// Wrap this widget by the Align with center right
  Widget centerRight({Key? key}) => Align(
        key: key,
        alignment: Alignment.centerRight,
        child: this,
      );

  /// Wrap this widget by the Align with top left
  Widget topLeft({Key? key}) => Align(
        key: key,
        alignment: Alignment.topLeft,
        child: this,
      );

  /// Wrap this widget by the Align with top center
  Widget topCenter({Key? key}) => Align(
        key: key,
        alignment: Alignment.topCenter,
        child: this,
      );

  /// Wrap this widget by the Align with top right
  Widget topRight({Key? key}) => Align(
        key: key,
        alignment: Alignment.topRight,
        child: this,
      );

  /// Wrap this widget by the Align with bottom left
  Widget bottomLeft({Key? key}) => Align(
        key: key,
        alignment: Alignment.bottomLeft,
        child: this,
      );

  /// Wrap this widget by the Align with bottom center
  Widget bottomCenter({Key? key}) => Align(
        key: key,
        alignment: Alignment.bottomCenter,
        child: this,
      );

  /// Wrap this widget by the Align with bottom right
  Widget bottomRight({Key? key}) => Align(
        key: key,
        alignment: Alignment.bottomRight,
        child: this,
      );

  /// Wrap this widget by the Padding with given EdgeInsets
  Widget padding(

          /// given EdgeInsets
          EdgeInsets edgeInsets,
          {Key? key}) =>
      Padding(
        key: key,
        padding: edgeInsets,
        child: this,
      );
}
