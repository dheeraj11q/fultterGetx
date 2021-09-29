import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getxf/core/services/interceptor/dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier? requestRetrier;

  RetryOnConnectionChangeInterceptor({
    this.requestRetrier,
  });

  @override
  Future onError(DioError err, a) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetrier?.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        // Let any new error from the retrier pass through
        return e;
      }
    }
    // Let the error pass through if it's not the error we're looking for
    return err;
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
