import 'package:cleanoauth2/core/routers/app_routers.dart';
import 'package:cleanoauth2/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:go_router/go_router.dart';

import 'authorization_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}

class MainPage extends StatelessWidget {

  static const String name= "MainPage";

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
              //context.push("/home");//OpcionUno
              context.pushNamed(HomeScreen.name);//OpcionDos
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
