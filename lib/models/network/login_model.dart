// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    Tokens? tokens;
    User? user;

    LoginModel({
        this.tokens,
        this.user,
    });

    LoginModel copyWith({
        Tokens? tokens,
        User? user,
    }) => 
        LoginModel(
            tokens: tokens ?? this.tokens,
            user: user ?? this.user,
        );

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        tokens: json["tokens"] == null ? null : Tokens.fromJson(json["tokens"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "tokens": tokens?.toJson(),
        "user": user?.toJson(),
    };
}

class Tokens {
    String? accessToken;
    String? refreshToken;

    Tokens({
        this.accessToken,
        this.refreshToken,
    });

    Tokens copyWith({
        String? accessToken,
        String? refreshToken,
    }) => 
        Tokens(
            accessToken: accessToken ?? this.accessToken,
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}

class User {
    int? id;
    String? email;
    String? nickname;

    User({
        this.id,
        this.email,
        this.nickname,
    });

    User copyWith({
        int? id,
        String? email,
        String? nickname,
    }) => 
        User(
            id: id ?? this.id,
            email: email ?? this.email,
            nickname: nickname ?? this.nickname,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        nickname: json["nickname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nickname": nickname,
    };
}
