


import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';

import '../cardImage2/model.dart';
import 'constants.dart';


class ApiQuery {
  var dio = Dio();
  final DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());

  Future<Response?> getQuery(
      String url,
      Map<String, String> headers,
      Map<String, dynamic>? query,
      String apiName,
      bool isCahed,
      bool isBaseUrlToBeAdded,
      bool forceRefres,
      ) async {
   // String appDocDir = (await getApplicationDocumentsDirectory()).path;
    //String appDocPath = appDocDir.path;
    // Options _cacheOptions = buildCacheOptions(
    //   const Duration(days: 1),
    //   forceRefresh: forceRefres,
    //   primaryKey: apiName,
    // );
    // var cookieJar = PersistCookieJar(
    //   ignoreExpires: true,
    //   storage: FileStorage(appDocDir + "/.cookies/"),
    // );
    Response? response;

    try {
      print(headers);

      Options options = Options(headers: headers);

      if (isCahed) {
        dio.interceptors.add(_dioCacheManager.interceptor);
      }
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          print(options.uri);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(e.toString());
          return handler.next(e);
        },
      ));

      if (isBaseUrlToBeAdded) {
        if (isCahed) {
          print(Constants.baseUrl + url);
          response = await dio.get(
            Constants.baseUrl + url,
            options: options,
            queryParameters: query,
          );
        } else {
          response = await dio.get(
            Constants.baseUrl + url,
            options: options,
            queryParameters: (query != null) ? query : null,
          );
        }
      } else {
        if (isCahed) {
          response = await dio.get(
            url,
            options: options,
            queryParameters: (query != null) ? query : null,
          );
        } else {
          response = await dio.get(
            url,
            options: options,
            queryParameters: query != null ? query : null,
          );
        }
      }
      return response;
    } on DioError catch (exception) {
      print(exception.response!.data);
      if (exception.toString().contains('SocketException')) {
        return exception.response;
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectTimeout) {
        return exception.response;
      } else {
        return exception.response;
      }
    }
  }
}


//
// import 'package:dio/dio.dart';
//
//
// class ApiProvider {
//   final Dio _dio = Dio(BaseOptions(baseUrl: "http://13.231.0.197/dev/api/v1"));
//
//   Future<List<Carding>> fetchCardImages() async {
//     try {
//       final response = await _dio.get("/cards");
//       final cardImageModel = cardImageModelFromJson(response.data);
//       return cardImageModel.cards;
//     } catch (error) {
//       throw Exception("Failed to fetch card images: ${error.toString()}");
//     }
//   }
// }





































































































































































