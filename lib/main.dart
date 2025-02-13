import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import 'authorization_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AuthorizationService authService = AuthorizationService();
    return Scaffold(
      appBar: AppBar(title: Text("OAuth2 Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            //AuthorizationTokenResponse? response = await authService.loginWithUsernamePassword("administrato", "administrator");
            AuthorizationTokenResponse? response = await authService.authenticate();
            if (response != null) {
              print("✅ Token obtenido: ${response.accessToken}");
            } else {
              print("⚠️ No se pudo obtener el token");
            }
          },
          child: Text("Iniciar Sesión"),
        ),
      ),
    );
  }
}
