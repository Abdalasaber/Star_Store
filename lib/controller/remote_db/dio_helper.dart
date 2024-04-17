import 'package:dio/dio.dart';
import 'const.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      receiveDataWhenStatusError: true,
    ));
  }

  static getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response =
          await dio.get(url, queryParameters: queryParameters, data: data);
      // ignore: avoid_print
      print(response.data);
      // ignore: avoid_print
      print(response.statusCode);
      return response;
    } catch (error) {
      // ignore: avoid_print
      print('the :$error');
    }
  }

  postData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response =
          await dio.post(url, queryParameters: queryParameters, data: data);
      // ignore: avoid_print
      print(response.data);
      // ignore: avoid_print
      print(response.statusCode);
      return response;
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response =
          await dio.delete(url, queryParameters: queryParameters, data: data);
      // ignore: avoid_print
      print(response.data);
      // ignore: avoid_print
      print(response.statusCode);
      return response;
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  putData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response =
          await dio.put(url, queryParameters: queryParameters, data: data);
      // ignore: avoid_print
      print(response.data);
      // ignore: avoid_print
      print(response.statusCode);
      return response;
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
