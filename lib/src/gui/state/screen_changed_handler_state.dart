import 'package:flutter/material.dart';

import '../ctrl/screen_ctrl.dart';

abstract class ScreenChangedHandlerState<T extends StatefulWidget>
    extends State<T> {
  ScreenChangedHandlerState() : super();

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    ScreenCtrl.instance.regStateHandler(this);
  }

  @override
  @mustCallSuper
  void dispose() {
    ScreenCtrl.instance.unregStateHandler(this);
    super.dispose();
  }

  @mustCallSuper
  void didChangeScreen() {
    // Just call setState to update widget
    setState(() {});
  }
}
