import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class OpenIDAuthenticator {

  final FlutterAppAuth appAuth = FlutterAppAuth();

  final _authConfid= AuthorizationServiceConfiguration(
      tokenEndpoint: "https://ggce-api1.alliance.cgiar.org/oauth2/token",
      authorizationEndpoint: "https://ggce-api1.alliance.cgiar.org/oauth2/authorize");

  final redirectUri = "com.example.cleanoauth2://demoapp/oauth2redirect";
  final scope = "trust read write";

  Future<void> startLogin() async {
    final AuthorizationTokenResponse result= await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          "pgnxx.p1pk2habpi4wtqh599g3@localhost",
          redirectUri,
          serviceConfiguration: _authConfid,
          clientSecret: "1gLJh5echtZ7TAmnu8cAJLMzbppmzkSn",
          scopes: ["openid","trust", "read", "write"],
        ));
    print("Access Token: ${result.accessToken}");
    print("ID Token: ${result.idToken}");
  }
}
