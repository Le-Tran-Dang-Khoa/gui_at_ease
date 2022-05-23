extension BaseExtensionOnListInt on List<int> {
  List<double> get toDouble => [for (var item in this) item.toDouble()];
}
