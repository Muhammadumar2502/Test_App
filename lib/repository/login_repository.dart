import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/login/login_event.dart';

import '../bloc/login/login_bloc.dart';

class LoginRepository {
  static Future request(BuildContext context,
      {required String password, required String email}) async {
    try {
      return context
          .read<LoginBloc>()
          .add(LoginRequestEvent(email: email, password: password));
    } catch (e) {
      print(e);
      print("Error in LoginRepository");
      return null;
    }
  }
}
