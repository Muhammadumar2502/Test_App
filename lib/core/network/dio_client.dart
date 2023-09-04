import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:test_app/models/local/login_local_model.dart';
import 'package:test_app/services/storage_service.dart';

import '../endpoints/endpoints.dart';
import 'dio_exeptions.dart';

class DioClient {
// dio instance
  dio.Dio _dio = dio.Dio();

  DioClient() {
    _dio
      ..options.baseUrl = Endpoints.base_url
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = dio.ResponseType.json;
  }

  Future<dio.Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onReceiveProgress,
    bool isWithToken = false,
  }) async {
    LoginLocal? loginlocal =
        (StorageService().read(StorageService.login) as LoginLocal?);

    String? accessToken = loginlocal?.accessToken;
    String? refreshToken = loginlocal?.refreshToken;
    try {
      final dio.Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: isWithToken
            ? (options
              ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
            : options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 415) {
        final dio.Response refresh_response = await _dio.post(Endpoints.refresh,
            data: {"refreshToken": (refreshToken ?? "")});
        if (refresh_response.statusCode == 200 ||
            refresh_response.statusCode == 201) {
          await StorageService().write(
            StorageService.login,
            loginlocal?.copyWith(
              refreshToken_: refresh_response.data["refreshToken"],
              accessToken_: refresh_response.data["accessToken"],
            ),
          );
          return await _dio.get(
            url,
            queryParameters: queryParameters,
            options: isWithToken
                ? (options
                  ?..headers = {
                    "Authorization": "Bearer " + (accessToken ?? "")
                  })
                : options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
        }
      }
      return response;
    } on dio.DioError catch (e) {
      DioExceptions.fromDioError(e);
      if (e.error is SocketException || e.type == DioErrorType.other) {
        return await onDisconnect(get(
          url,
          queryParameters: queryParameters,
          options: isWithToken
              ? (options
                ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
              : options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
      }

      return e.response!;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dio.Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
    bool isWithToken = false,
  }) async {
    LoginLocal? loginlocal =
        (StorageService().read(StorageService.login) as LoginLocal?);

    String? accessToken = loginlocal?.accessToken;
    String? refreshToken = loginlocal?.refreshToken;
    try {
      final dio.Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: isWithToken
            ? (options
              ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
            : options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 415) {
        final dio.Response refresh_response = await _dio.post(Endpoints.refresh,
            data: {"refreshToken": (refreshToken ?? "")});
        if (refresh_response.statusCode == 200 ||
            refresh_response.statusCode == 201) {
          await StorageService().write(
            StorageService.login,
            loginlocal?.copyWith(
              refreshToken_: refresh_response.data["refreshToken"],
              accessToken_: refresh_response.data["accessToken"],
            ),
          );
          return await _dio.post(
            url,
            data: data,
            queryParameters: queryParameters,
            options: isWithToken
                ? (options
                  ?..headers = {
                    "Authorization": "Bearer " + (accessToken ?? ""),
                  })
                : options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
        }
      }
      return response;
    } on dio.DioError catch (e) {
      DioExceptions.fromDioError(e);
      if (e.error is SocketException || e.type == DioErrorType.other) {
        return await onDisconnect(post(
          url,
          data: data,
          queryParameters: queryParameters,
          options: isWithToken
              ? (options
                ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
              : options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
      }
      return e.response!;
    } catch (e) {
      rethrow;
    }
  }

  Future<dio.Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
    bool isWithToken = false,
  }) async {
    LoginLocal? loginlocal =
        (StorageService().read(StorageService.login) as LoginLocal?);

    String? accessToken = loginlocal?.accessToken;
    String? refreshToken = loginlocal?.refreshToken;
    try {
      final dio.Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: isWithToken
            ? (options
              ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
            : options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 415) {
        final dio.Response refresh_response = await _dio.post(Endpoints.refresh,
            data: {"refreshToken": (refreshToken ?? "")});
        if (refresh_response.statusCode == 200 ||
            refresh_response.statusCode == 201) {
          await StorageService().write(
            StorageService.login,
            loginlocal?.copyWith(
              refreshToken_: refresh_response.data["refreshToken"],
              accessToken_: refresh_response.data["accessToken"],
            ),
          );
          return await _dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
            options: isWithToken
                ? (options
                  ?..headers = {
                    "Authorization": "Bearer " + (accessToken ?? "")
                  })
                : options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
        }
      }
      return response;
    } on dio.DioError catch (e) {
      DioExceptions.fromDioError(e);

      if (e.error is SocketException || e.type == DioErrorType.other) {
        return await onDisconnect(put(
          url,
          data: data,
          queryParameters: queryParameters,
          options: isWithToken
              ? (options
                ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
              : options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
      }
      return e.response!;
    } catch (e) {
      rethrow;
    }
  }

  Future<dio.Response> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onReceiveProgress,
    bool isWithToken = false,
  }) async {
    LoginLocal? loginlocal =
        (StorageService().read(StorageService.login) as LoginLocal?);

    String? accessToken = loginlocal?.accessToken;
    String? refreshToken = loginlocal?.refreshToken;
    try {
      final dio.Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: isWithToken
            ? (options
              ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
            : options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 415) {
        final dio.Response refresh_response = await _dio.post(Endpoints.refresh,
            data: {"refreshToken": (refreshToken ?? "")});
        if (refresh_response.statusCode == 200 ||
            refresh_response.statusCode == 201) {
          await StorageService().write(
            StorageService.login,
            loginlocal?.copyWith(
              refreshToken_: refresh_response.data["refreshToken"],
              accessToken_: refresh_response.data["accessToken"],
            ),
          );
          return await _dio.patch(
            url,
            data: data,
            queryParameters: queryParameters,
            options: isWithToken
                ? (options
                  ?..headers = {
                    "Authorization": "Bearer " + (accessToken ?? "")
                  })
                : options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
        }
      }
      return response;
    } on dio.DioError catch (e) {
      DioExceptions.fromDioError(e);
      if (e.error is SocketException || e.type == DioErrorType.other) {
        return await onDisconnect(patch(
          url,
          data: data,
          queryParameters: queryParameters,
          options: isWithToken
              ? (options
                ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
              : options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
      }

      return e.response!;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dio.Response> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
    bool isWithToken = false,
  }) async {
    LoginLocal? loginlocal =
        (StorageService().read(StorageService.login) as LoginLocal?);

    String? accessToken = loginlocal?.accessToken;
    String? refreshToken = loginlocal?.refreshToken;
    try {
      final dio.Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: isWithToken
            ? (options
              ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
            : options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 415) {
        final dio.Response refresh_response = await _dio.post(Endpoints.refresh,
            data: {"refreshToken": (refreshToken ?? "")});
        if (refresh_response.statusCode == 200 ||
            refresh_response.statusCode == 201) {
          await StorageService().write(
            StorageService.login,
            loginlocal?.copyWith(
              refreshToken_: refresh_response.data["refreshToken"],
              accessToken_: refresh_response.data["accessToken"],
            ),
          );
          return await _dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: isWithToken
                ? (options
                  ?..headers = {
                    "Authorization": "Bearer " + (accessToken ?? "")
                  })
                : options,
            cancelToken: cancelToken,
          );
        }
      }
      return response.data;
    } on dio.DioError catch (e) {
      DioExceptions.fromDioError(e);
      if (e.error is SocketException || e.type == DioErrorType.other) {
        return await onDisconnect(delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: isWithToken
              ? (options
                ?..headers = {"Authorization": "Bearer " + (accessToken ?? "")})
              : options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
      }
      return e.response!;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> onDisconnect(Future<Response> onConnectionError) async {
    Connectivity connectivity = Connectivity();
    final respomseCompleter = Completer<Response>();
    StreamSubscription? streamSubscription;
    streamSubscription =
        connectivity.onConnectivityChanged.listen((connectivyResult) {
      if (connectivyResult != ConnectivityResult.none) {
        streamSubscription?.cancel();
        respomseCompleter.complete(onConnectionError);
      }
    });
    return respomseCompleter.future;
  }
}
