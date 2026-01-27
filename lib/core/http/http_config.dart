import 'package:dio/dio.dart';

/// {@template http_config}
/// Configuration for HttpManager
/// {@endtemplate}
class HttpConfig {
  const HttpConfig({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.headers = const {},
  });
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Map<String, dynamic> headers;

  /// Creates the BaseOptions for Dio
  BaseOptions toBaseOptions() {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        ...headers,
      },
    );
  }
}
