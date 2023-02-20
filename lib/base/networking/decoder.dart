import 'result.dart';

typedef Decoder<T> = T Function(dynamic data);

class BaseDecoder<T> {
  final Result result;
  final Decoder decoder;

  BaseDecoder(
    this.result, {
    required this.decoder,
  });

  bool get success => result.success;

  bool get hasError => result.hasError;

  String? get message => result.message;

  Errors? get error => result.error;

  T get model => decoded();

  T decoded() {
    try {
      if (result.data != null) {
        return decoder(result.data) as T;
      } else {
        throw UnsupportedError(
            "BaseDecoder Error=> ${T.runtimeType} data is null");
      }
      // ignore: avoid_catching_errors
    } on TypeError catch (e) {
      throw UnsupportedError(
          "BaseDecoder Error=> ${T.runtimeType} ${e.stackTrace}");
    } on Exception catch (e) {
      throw UnsupportedError(
          "BaseDecoder Error=> ${T.runtimeType} ${e.toString()}");
    }
  }
}
