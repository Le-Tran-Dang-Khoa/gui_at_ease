import 'package:flutter/material.dart';

import '../state/screen_changed_handler_state.dart';

abstract class ScreenChangedHandlerWidget extends StatefulWidget {
  const ScreenChangedHandlerWidget({Key? key}) : super(key: key);

  @override
  ScreenChangedHandlerState<ScreenChangedHandlerWidget> createState();
}
