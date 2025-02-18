import 'package:cleanoauth2/singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as client;
import 'package:url_launcher/url_launcher.dart';

class AuthorizationService {
  final FlutterAppAuth _appAuth = FlutterAppAuth();
  static const String clientId = "pgnxx.p1pk2habpi4wtqh599g3@localhost";
  static const String baseUrl = "https://ggce-api1.alliance.cgiar.org/login";
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
        print("Access Token: ${result.accessToken}");
        print("ID Token: ${result.idToken}");
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



  Future<bool> logout() async {
    try {
      // 1. Leer el token de acceso almacenado
      final String? token = await Singleton.token;

      // 2. Intentar revocar el token si es posible
      if (token != null) {
        print("Tokeennnnnn: ${Singleton.token}");
        return await _revokeToken(token);
      }

      // 3. Eliminar credenciales almacenadas localmente
      //await _secureStorage.deleteAll();
      //print("✅ Sesión cerrada correctamente");

      // 4. Opcional: Redirigir al usuario al endpoint de logout del servidor
      //return await _logoutFromServer();
    } catch (e) {
      print("Error al cerrar sesión: $e");
    }
    return false;
  }

  Future<bool> _revokeToken(String token) async {
    final response = await http.post(
      Uri.parse("https://ggce-api1.alliance.cgiar.org/oauth2/revoke"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "token": token,
        "client_id": clientId,
        "client_secret": "1gLJh5echtZ7TAmnu8cAJLMzbppmzkSn"
      },
    );

    if (response.statusCode == 200) {
      print("Token revocado correctamente");
      Singleton.token= null;
      return true;
    } else {
      print("No se pudo revocar el token: ${response.body}");
    }
    return false;
  }

  //https://ggce-api1.alliance.cgiar.org/logout?client_id=defaultclient%40localhost&post_logout_redirect_uri=https%3A%2F%2Fggce-ui1.alliance.cgiar.org
  Future<bool> logout2() async{
    final Map<String, String> headers = {
      'Authorization': Singleton.token!,
      'Content-Type': 'application/json',
    };
    final response = await client.get(
        Uri.parse("https://ggce-api1.alliance.cgiar.org/logout?client_id=$clientId&post_logout_redirect_uri=$baseUrl"),);
    if (response.statusCode == 200) {
      print("Token revocado correctamente");
      Singleton.token= null;
      return true;
    } else {
      throw Exception("Error al obtener el usuario");
    }
  }

}
