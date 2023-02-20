import '../../x_res/enums.dart';

class ApiData {
  final Method method;
  final String url;
  final dynamic header;
  final dynamic params;
  final dynamic response;
  final String? exception;
  final String? bodyString;
  final DateTime date;

  ApiData(this.method, this.url, this.params, this.response, this.exception,
      this.bodyString, this.date, this.header);
}

class ApiLog {
  factory ApiLog() => _instance ??= ApiLog._();

  ApiLog._();

  static ApiLog? _instance;

  List<ApiData> apiOk = [];
  List<ApiData> apiException = [];

  void addRequestOk(Method method, String url, dynamic params, dynamic response,
      dynamic header) {
    apiOk.add(ApiData(
        method, url, params, response, null, null, DateTime.now(), header));
  }

  void addRequestException(Method method, String url, dynamic params,
      String? exception, String? bodyString, dynamic header) {
    apiException.add(ApiData(method, url, params, null, exception, bodyString,
        DateTime.now(), header));
  }

  void clear() {
    apiOk.clear();
    apiException.clear();
  }
}
