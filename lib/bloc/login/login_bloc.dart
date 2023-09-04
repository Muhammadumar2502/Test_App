import 'package:bloc/bloc.dart';
import 'package:test_app/bloc/login/login_event.dart';
import 'package:test_app/models/network/login_model.dart';

import '../../core/endpoints/endpoints.dart';
import '../../core/network/dio_client.dart';
import '../state.dart';
import 'package:dio/dio.dart' as dio;

class LoginBloc extends Bloc<LoginEvent, DataState<LoginModel>> {
  DioClient dioClient = DioClient();
  LoginBloc() : super(DataIntial()) {
    on<LoginRequestEvent>((event, emit) =>
        loginRequest(email: event.email, password: event.password));
  }

  loginRequest({
    required String email,
    required String password,
  }) async {
    emit(DataWaiting());

    dio.Response response = await dioClient.post(
      Endpoints.login,
      data: {'password': password, 'email': email},
    );

    // print(response.statusCode);
    // print(response.data);

    if (response.statusCode == 200) {
      emit(
        DataSuccess(
          data: LoginModel.fromJson(response.data),
        ),
      );
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(
        DataError(
          error: DataRequestError(
            statusCode: response.statusCode,
            message: response.statusMessage,
          ),
        ),
      );
    }
  }
}
