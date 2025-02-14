import 'package:cleanoauth2/core/routers/app_routers.dart';
import 'package:cleanoauth2/presentation/providers/user_provider.dart';
import 'package:cleanoauth2/presentation/screen/home_screen.dart';
import 'package:cleanoauth2/singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'authorization_service.dart';
import 'data/datasources/user_datasource.dart';
import 'data/repositories/user_repository_impl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final userRepositoryImpl= UserRepositoryImpl(datasource: UserDatasource(client: http.Client()));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserProvider(userRepository: userRepositoryImpl)..getUser())
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
      ),
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
              Singleton.token = "Bearer ${response.accessToken}";
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
