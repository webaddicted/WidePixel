import 'dart:async';
import 'dart:io';

// import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';


/// Helper class for configuring Api calls
class ApiBaseHelper {
  Dio? _dio;
  // Alice? alice;

  ApiBaseHelper() {
    // alice = Alice(showNotification: true);
    var options = BaseOptions(
        receiveTimeout: ApiConstant.TIMEOUT,
        connectTimeout: ApiConstant.TIMEOUT);
    options.baseUrl = ApiConstant.BASE_URL;

    var map = Map<String, dynamic>();
    map['Authorization'] = 'Client-ID ${ApiConstant.UnsplashApiKey}';

    _dio = Dio(
      options,
    );
    _dio!.options.headers = map;
    // _dio.options.headers['content-Type'] = 'application/json';
    // _dio.options.headers["authorization"] = "token ${token}";
    _dio!.interceptors.add(LogInterceptor());
    // _dio!.interceptors.add(alice!.getDioInterceptor()); //displays logs in notification view
  }

  /// Method : GET
  /// Params : url
  Future<Response<dynamic>> getWithoutParams(String url) async {
    var response =
        await _dio?.get(url, options: Options(responseType: ResponseType.json));
    return response!;
  }

  /// Method : GET
  /// Params : url, map for parameters
  Future<Response<dynamic>> getWithParam(
      {String url = '', Map<String, dynamic> ?params}) async {
    Response response;
    try {
      response = (await _dio?.get(url,
          queryParameters: params,
          options: Options(responseType: ResponseType.json)))!;
    } on SocketException catch (_) {
      print('object SocketException');
      response = Response(requestOptions: RequestOptions(path: 'path'));
      response.statusCode = ApiResponseCode.INTERNET_UNAVAILABLE;
      response.statusMessage = StrConst.NO_INTERNET_CONNECTION;
    } on Exception catch(e) {
      print('object Exception');
      response = Response(requestOptions: RequestOptions(path: 'path'));
      response.statusCode = ApiResponseCode.UNKNOWN;
      response.statusMessage = e.toString()+" "+StrConst.SOMETHING_WENT_WRONG;
      // response.data = e;
    }
    print('response : $response');
    return response;
  }

  /// Method : POST
  /// Params : url, map for parameters
  Future<Response> post({String url = '', Map<String, dynamic>? params}) async {
    var response = await _dio!.post(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : PUT
  /// Params : url, map for parameters
  Future<Response> put(String url, Map<String, String> params) async {
    var response = await _dio!.put(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : DELETE
  /// Params : url, map for parameters
  Future<Response> delete(String url, Map<String, String> params) async {
    var response = await _dio!.delete(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}

/// Api Response codes
class ApiResponseCode {
  static const int SUCCESS_200            = 200;
  static const int SUCCESS_201            = 201;
  static const int ERROR_400              = 400;
  static const int ERROR_499              = 499;
  static const int ERROR_401              = 201;
  static const int ERROR_404              = 201;
  static const int ERROR_500              = 500;
  static const int INTERNET_UNAVAILABLE   = 999;
  static const int UNKNOWN                = 533;
}
final apiHelper = ApiBaseHelper();