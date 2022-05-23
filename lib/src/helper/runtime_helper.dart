import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb, kReleaseMode, kDebugMode;

class RuntimeHelper {
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;
  static bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isWeb => kIsWeb;
  static bool get isRelease => kReleaseMode;
  static bool get isDebug => kDebugMode;
}
