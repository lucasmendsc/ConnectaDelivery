import 'dart:convert';

import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'models/Usuario.dart';

class Utils {
  static const String jwtKey = "<connecta>";

  static String generateJWT(Usuario usuario) {
    final claimSet = JwtClaim(
        issuer: "http://localhost:8080",
        subject: usuario.id.toString(),
        otherClaims: <String, dynamic>{},
        maxAge: Duration(days: 1));

    final token = "Bearer ${issueJwtHS256(claimSet, jwtKey)}";
    return token;
  }

}