// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:findmate/x_utils/device_Info.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';

import '../base_common_widgets.dart';
import 'result.dart';

enum Method { GET, POST, DELETE }

const LOG_HEADER = false;
const TIME_OUT = Duration(seconds: 30);
const RETRY_TIMEOUT = Duration(seconds: 40);

class ApiService {
  String get backendUrl => 'ServerConfig().backendUrl';

  ApiService() {
    _api = _Api(backendUrl: backendUrl);
  }

  late _Api _api;

  Future<Result> getData({
    required String endPoint,
    Map<String, dynamic>? params,
    Duration timeOut = TIME_OUT,
  }) async {
    return _api.getData(endPoint: endPoint, params: params, timeOut: timeOut);
  }

  Future<Result> postData({
    required String endPoint,
    dynamic params,
    Duration timeOut = TIME_OUT,
  }) async {
    return _api.postData(endPoint: endPoint, params: params, timeOut: timeOut);
  }

  Future<Result> deleteData({
    required String endPoint,
    Map<String, dynamic>? params,
    Duration timeOut = TIME_OUT,
  }) async {
    return _api.deleteData(
        endPoint: endPoint, params: params, timeOut: timeOut);
  }

  Future<Result> callManualy({
    required Method method,
    required String endPoint,
    dynamic params,
    Duration timeOut = TIME_OUT,
  }) async {
    return _api.callManually(
      endPoint: endPoint,
      method: method,
      params: params,
      timeOut: timeOut,
    );
  }
}

/// PRIVATE CLASS
/// USE THIS VIA [ApiService] class
class _Api extends GetConnect with BaseCommonWidgets {
  final String? backendUrl;
  Duration _timeOut = TIME_OUT;

  _Api({this.backendUrl});

  @override
  String get baseUrl => backendUrl ?? 'ServerConfig().backendUrl';

  @override
  void onInit() {
    httpClient.timeout = _timeOut;
    httpClient.addRequestModifier<void>((request) async {
      request.headers['Device-Id'] = DeviceInfo().deviceId;
      request.headers["App-Version"] = DeviceInfo().appVersion;
      request.headers['Authorization'] =
          'mainProvider.accessToken?.fullToken ?? ""';
      if (LOG_HEADER && kDebugMode) {
        log(request.headers.toString(), name: baseUrl);
      }
      return request;
    });

    super.onInit();
  }

  /// RETURN DATA WITH [Result.body] MODELS and please parse with your model
  Future<Result> callManually({
    required Method method,
    required String endPoint,
    dynamic params,
    Duration timeOut = RETRY_TIMEOUT,
  }) async {
    onInit();
    Response? res;
    try {
      if (method == Method.GET) {
        final query = params as Map<String, dynamic>?;
        res = await get(endPoint, query: query);
      } else if (method == Method.POST) {
        res = await post(endPoint, params);
      } else {
        final query = params as Map<String, dynamic>?;
        res = await delete(endPoint, query: query);
      }

      if (res.isOk) {
        _requestOk(
            method, endPoint, params, res.bodyString, res.request?.headers);
        return handlerResult(Result.fromJson(res.bodyString!),
            endPoint: endPoint);
      } else {
        _requestException(
          method,
          endPoint,
          "PASSING ERROR",
          params: params,
          bodyString: res.bodyString,
        );
        return Result.unknowError();
      }
    } catch (e) {
      _requestException(
        method,
        endPoint,
        "Error",
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return Result.unknowError();
    }
  }

  /// FOR NETWORKING WITH THE [Method.GET]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> getData({
    required String endPoint,
    Map<String, dynamic>? params,
    required Duration timeOut,
  }) async {
    _timeOut = timeOut;
    onInit();
    Response? res;
    const method = Method.GET;
    try {
      res = await get(endPoint, query: params);
      if (res.status.connectionError) {
        return onRequestTimeOut(res, method: method, endPoint: endPoint);
      } else if (res.isOk) {
        _requestOk(
            method, endPoint, params, res.bodyString, res.request?.headers);
      } else {
        _requestException(
          method,
          endPoint,
          "ERROR",
          params: params,
          bodyString: res.bodyString,
          exception: res.statusText,
        );
      }
      return handlerResult(Result.fromJson(res.bodyString!),
          endPoint: endPoint);
    } catch (e) {
      _requestException(
        method,
        endPoint,
        "ERROR",
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(
        method: method,
        endPoint: endPoint,
        params: params,
      );
    }
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> postData({
    required String endPoint,
    dynamic params,
    required Duration timeOut,
  }) async {
    _timeOut = timeOut;
    onInit();
    Response? res;
    const method = Method.POST;
    try {
      res = await post(endPoint, params);

      if (res.status.connectionError) {
        return onRequestTimeOut(res, method: method, endPoint: endPoint);
      } else if (res.isOk) {
        _requestOk(
            method, endPoint, params, res.bodyString, res.request?.headers);
      } else {
        _requestException(
          method,
          endPoint,
          "ERROR",
          params: params,
          bodyString: res.bodyString,
          exception: res.statusText,
        );
      }
      return handlerResult(Result.fromJson(res.bodyString ?? ""),
          endPoint: endPoint);
    } catch (e) {
      _requestException(
        method,
        endPoint,
        "ERROR",
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(
        method: method,
        endPoint: endPoint,
        params: params,
      );
    }
  }

  /// FOR NETWORKING WITH [Method.DELETE]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> deleteData({
    required String endPoint,
    required Duration timeOut,
    Map<String, dynamic>? params,
  }) async {
    _timeOut = timeOut;
    onInit();
    Response? res;
    const method = Method.DELETE;
    try {
      res = await delete(endPoint, query: params);
      if (res.status.connectionError) {
        return onRequestTimeOut(res, method: method, endPoint: endPoint);
      } else if (res.isOk) {
        _requestOk(
            method, endPoint, params, res.bodyString, res.request?.headers);
      } else {
        _requestException(
          method,
          endPoint,
          "ERROR",
          params: params,
          bodyString: res.bodyString,
          exception: res.statusText,
          header: res.request?.headers,
        );
      }
      return handlerResult(Result.fromJson(res.bodyString!),
          endPoint: endPoint);
    } catch (e) {
      _requestException(
        method,
        endPoint,
        "ERROR",
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(
        method: method,
        endPoint: endPoint,
        params: params,
      );
    }
  }

  _requestException(
    Method method,
    String endPoint,
    String status, {
    String? exception,
    String? bodyString,
    dynamic params,
    dynamic header,
  }) {
    if (kDebugMode) {
      final fullUrl = baseUrl + endPoint;
      log("$method: $fullUrl Params: $params", name: "API");
      log("$status => $exception", name: "API");
    }

    // if (!ServerConfig().isProduct) {
    //   ApiLog().addRequestException(
    //       method, baseUrl + endPoint, params, exception, bodyString, header);
    // }
    // try {
    //   EventManager().fire(ApiException(
    //     endPoint: endPoint,
    //     exception: exception,
    //     method: method.toString(),
    //     status: status,
    //     param: params,
    //     bodyString: bodyString,
    //   ));
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  _requestOk(Method method, String endpoint, dynamic params, dynamic response,
      dynamic header) {
    if (kDebugMode) {
      final fullUrl = baseUrl + endpoint;
      log("$method: $fullUrl Params: $params", name: "API");
      try {
        const JsonDecoder decoder = JsonDecoder();
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        final object = decoder.convert(response as String);
        log("Response => ${encoder.convert(object)}", name: "API");
      } catch (e) {
        log(response.toString(), name: "API");
      }
    }
    // if (!ServerConfig().isProduct) {
    //   ApiLog()
    //       .addRequestOk(method, baseUrl + endpoint, params, response, header);
    // }
  }

  Result handlerResult(Result result, {String? endPoint}) {
    if (!result.success) {
      if (result.error != null) {
        //Handler Error
      }
    }
    return result;
  }

  Future<Result> onTimeOut(
      {required Method method,
      required String endPoint,
      dynamic params}) async {
    return Result();
  }

  Future<Result> onServerError(
      {required Method method,
      required String endPoint,
      dynamic params}) async {
    return Result();
  }

  bool shouldShowDialog(String? dialogName) {
    if (!(Get.isDialogOpen ?? false)) return true;
    final route = Get.rawRoute;
    if (dialogName != null && route is GetDialogRoute) {
      return route.settings.name != dialogName &&
          route.settings.name != "NetworkError";
    }
    return true;
  }

  Future<Result> onRequestTimeOut(
    Response response, {
    required Method method,
    required String endPoint,
    dynamic params,
  }) {
    _requestException(
      method,
      endPoint,
      "TimeOut",
      params: params,
      bodyString: response.bodyString,
      exception: response.statusText,
    );
    return onTimeOut(
      method: method,
      endPoint: endPoint,
      params: params,
    );
  }
}
