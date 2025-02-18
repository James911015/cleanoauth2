import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class AuthorizationService {
  final FlutterAppAuth _appAuth = FlutterAppAuth();
  static const String clientId = "pgnxx.p1pk2habpi4wtqh599g3@localhost";
  static const String redirectUri = "com.example.cleanoauth2://demoapp/oauth2redirect";
  static const String authorizationEndpoint = "https://ggce-api1.alliance.cgiar.org/oauth2/authorize";
  static const String tokenEndpoint = "https://ggce-api1.alliance.cgiar.org/oauth2/token";
  static const List<String> scopes = ["openid", "profile", "email"];

  Future<AuthorizationTokenResponse?> authenticate() async {
    try {
      final AuthorizationTokenResponse? result =
      await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUri,
          discoveryUrl: "https://ggce-api1.alliance.cgiar.org/.well-known/openid-configuration",
          clientSecret: "1gLJh5echtZ7TAmnu8cAJLMzbppmzkSn",
          /*serviceConfiguration: AuthorizationServiceConfiguration(
            authorizationEndpoint: authorizationEndpoint,
            tokenEndpoint: tokenEndpoint,
          ),*/
          scopes: scopes,
        ),
      );

      if (result != null) {
        print("✅ Access Token: ${result.accessToken}");
        print("✅ ID Token: ${result.idToken}");
        return result;
      } else {
        print("⚠️ Autenticación fallida");
        return null;
      }
    } catch (e) {
      print("❌ Error en la autenticación: $e");
      return null;
    }
  }

  //No es ncesidad de implemnetar este codigo
  Future<AuthorizationTokenResponse?> loginWithUsernamePassword(String username, String password) async {
    try {
      final AuthorizationTokenResponse? result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUri,
          clientSecret: "1gLJh5echtZ7TAmnu8cAJLMzbppmzkSn",
          serviceConfiguration: AuthorizationServiceConfiguration(
            authorizationEndpoint: authorizationEndpoint,
            tokenEndpoint: tokenEndpoint,
          ),
          scopes: scopes,
          additionalParameters: {
            "grant_type": "password",
            "username": username,
            "password": password,
          },
        ),
      );

      if (result != null) {
        print("✅ Access Token: ${result.accessToken}");
        print("✅ Refresh Token: ${result.refreshToken}");
        return result;
      } else {
        print("⚠️ No se obtuvo un token");
        return null;
      }
    } catch (e) {
      print("❌ Error en la autenticación: $e");
      return null;
    }
    return null;
  }
}
