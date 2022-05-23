import 'package:flutter/material.dart';

import '../ctrl/screen_ctrl.dart';

abstract class HiddenStateManagedLifeCycleApp extends StatefulWidget {
  const HiddenStateManagedLifeCycleApp({Key? key}) : super(key: key);

  @override
  State<HiddenStateManagedLifeCycleApp> createState() =>
      _HiddenStateManagedLifeCycleAppState();

  void initState() {}
  void dispose() {}
  void didChangeAppLifecycleState(AppLifecycleState state) {}
  void didChangeMetrics() {}
  void didChangeLocales(List<Locale>? locales) {}
  void didChangeTextScaleFactor() {}
  Widget build(BuildContext context);
}

class _HiddenStateManagedLifeCycleAppState
    extends State<HiddenStateManagedLifeCycleApp> with WidgetsBindingObserver {
  _HiddenStateManagedLifeCycleAppState() : super();

  @override
  void initState() {
    super.initState();
    widget.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      widget.didChangeAppLifecycleState(state);

  @override
  void didChangeMetrics() {
    ScreenCtrl.instance.refreshMetrics();
    widget.didChangeMetrics();
  }

  @override
  void didChangeLocales(List<Locale>? locales) =>
      widget.didChangeLocales(locales);

  @override
  void didChangeTextScaleFactor() => widget.didChangeTextScaleFactor();

  @override
  Widget build(BuildContext context) => widget.build(context);
}
