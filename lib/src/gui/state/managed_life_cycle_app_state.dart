import 'package:flutter/material.dart';

import '../ctrl/screen_ctrl.dart';

abstract class ManagedLifeCycleAppState<T extends StatefulWidget>
    extends State<T> with WidgetsBindingObserver {
  ManagedLifeCycleAppState() : super();

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  @mustCallSuper
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  @mustCallSuper
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  @mustCallSuper
  void didChangeMetrics() {
    ScreenCtrl.instance.refreshMetrics();
  }

  @override
  @mustCallSuper
  void didChangeLocales(List<Locale>? locales) {}

  @override
  @mustCallSuper
  void didChangeTextScaleFactor() {}
}
