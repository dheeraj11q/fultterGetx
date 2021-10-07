import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getxf/core/utils/strings/urls.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  Dio? _dio;

  // final baseUrl = Urls.photosBaseUrl;

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: Urls.place,
      responseType: ResponseType.json,
      connectTimeout: 100000,
      receiveTimeout: 30000,
    ));

    // _dio?.interceptors.add(PrettyDioLogger(error: true));

    initializeInterceptors();
  }

  //GET

  Future getRequest({String? endPoint}) async {
    var response;

    try {
      response = await _dio!.get(endPoint ?? '');
    } on DioError catch (e) {
      print(e.message);

      print("Erro type ${e.type}");

      throw Exception(e.message);
    }

    return response;
  }

  // POST

  Future postRequest({String? endPoint, Map<String, dynamic>? body}) async {
    var response;

    try {
      response = await _dio!.post(endPoint ?? '', queryParameters: body ?? {});
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio?.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error

      // print("here dio error ${e.type}");

      if (e.type == DioErrorType.other) {
        Get.defaultDialog(
            title: "Opps!",
            middleText: "Internet is not Conected",
            onCancel: () {},
            onConfirm: () {
              Get.back();
            });
      }

      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));
  }
}
