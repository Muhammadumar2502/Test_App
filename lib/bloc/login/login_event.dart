abstract class LoginEvent {}

class LoginRequestEvent extends LoginEvent {
  String email;
  String password;
  LoginRequestEvent({
    required this.email,
    required this.password,
  });
}
