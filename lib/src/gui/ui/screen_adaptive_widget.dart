import 'package:flutter/material.dart';

import 'hidden_state_adaptive_widget.dart';

class ScreenAdaptiveWidget extends HiddenStateAdaptiveWidget {
  final Widget Function(BuildContext buildContext) builder;
  const ScreenAdaptiveWidget({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) => builder(context);
}
