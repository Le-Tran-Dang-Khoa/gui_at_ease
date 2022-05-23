import 'package:flutter/material.dart';

import '../state/managed_life_cycle_app_state.dart';

abstract class ManagedLifeCycleApp extends StatefulWidget {
  const ManagedLifeCycleApp({Key? key}) : super(key: key);

  @override
  ManagedLifeCycleAppState<ManagedLifeCycleApp> createState();
}
