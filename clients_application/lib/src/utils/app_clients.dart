import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import '../configs/configs.dart';
import 'utils.dart';

class AppClients extends DioForNative {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";

  static AppClients? _instance;

  factory AppClients(
      {String baseUrl = AppEndpoint.BASE_URL_BOOKING, BaseOptions? options}) {
    if (_instance == null) _instance = AppClients._(baseUrl: baseUrl);
    if (options != null) _instance!.options = options;
    _instance!.options.baseUrl = baseUrl;
    return _instance!;
  }

  AppClients._(
      {String baseUrl = AppEndpoint.BASE_URL_BOOKING, BaseOptions? options})
      : super(options) {
    this.interceptors.add(InterceptorsWrapper(
          onRequest: _requestInterceptor,
          onResponse: _responseInterceptor,
          onError: _errorInterceptor,
        ));
    this.options.baseUrl = baseUrl;
  }

  _requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = AppPref.accessToken;
    options.connectTimeout = AppEndpoint.connectionTimeout;
    options.receiveTimeout = AppEndpoint.receiveTimeout;
    options.headers["Authorization"] = "Bearer  ${accessToken ?? ''}";

    switch (options.method) {
      case AppClients.GET:
        log("${options.method}: ${options.uri}\nParams: ${options.queryParameters}\nHeader: ${options.headers}");
        break;

      case AppClients.POST:
        if (options.data is Map) {
          //Remove if contains
          if (options.data.containsKey("accessToken"))
            log("${options.method}: ${options.uri}\nParams: ${options.queryParameters}\nHeader: ${options.headers}");
        } else if (options.data is FormData) {
          options.data.fields.addAll([MapEntry("accessToken", accessToken)]);
          log("${options.method}: ${options.uri}\nParams: ${options.data.fields}");
        }
        break;
      default:
        break;
    }

    handler.next(options);
  }

  _responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  _errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    log("${dioError.type} - Error ${dioError.message}");
    handler.next(dioError);
  }
}
