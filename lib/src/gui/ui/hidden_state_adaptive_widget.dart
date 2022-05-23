import 'package:flutter/material.dart';

import '../state/screen_changed_handler_state.dart';

abstract class HiddenStateAdaptiveWidget extends StatefulWidget {
  const HiddenStateAdaptiveWidget({Key? key}) : super(key: key);

  @override
  ScreenChangedHandlerState<HiddenStateAdaptiveWidget> createState() =>
      _HiddenStateAdaptiveWidgetState();

  void initState() {}
  void dispose() {}
  void onLoaded(BuildContext context) {}
  Widget build(BuildContext context);
}

class _HiddenStateAdaptiveWidgetState
    extends ScreenChangedHandlerState<HiddenStateAdaptiveWidget> {
  _HiddenStateAdaptiveWidgetState() : super();

  @override
  void initState() {
    super.initState();
    // Raise initState event to widget
    widget.initState();
    // Raise onLoaded event to widget
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.onLoaded(context));
  }

  @override
  void dispose() {
    // Raise dispose event to widget
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
