class ExceptionData {
  final Object error;
  final StackTrace stack;

  ExceptionData(this.error, this.stack);
}

class ExceptionLog {
  factory ExceptionLog() => _instance ??= ExceptionLog._();

  ExceptionLog._();

  static ExceptionLog? _instance;

  List<ExceptionData> data = [];

  void clear() {
    data.clear();
  }

  void add(Object error, StackTrace stack) {
    data.add(ExceptionData(error, stack));
  }
}
