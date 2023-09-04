import 'package:hive/hive.dart';

part "login_local_model.g.dart";

@HiveType(typeId: 0)
class LoginLocal extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? nickname;
  @HiveField(3)
  String? accessToken;
  @HiveField(4)
  String? refreshToken;

  LoginLocal({ this.id, this.email, this.nickname, this.refreshToken,this.accessToken});
  

   LoginLocal copyWith({
   int? id_,String? email_,String? nickname_,String? refreshToken_,String? accessToken_
  }){
   return LoginLocal(
            id: id_ ?? id,
            nickname: nickname_ ?? nickname,
            email: email_ ?? email,
            accessToken: accessToken_ ?? accessToken,
            refreshToken: refreshToken_ ?? refreshToken,
        );
  }

}
