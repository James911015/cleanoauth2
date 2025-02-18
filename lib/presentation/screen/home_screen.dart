import 'package:cleanoauth2/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../authorization_service.dart';
import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {

  static const String name = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    AuthorizationService authService = AuthorizationService();
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla Principal"),),
      body: userProvider.isLoading
      ? Center(child: CircularProgressIndicator( strokeWidth: 2,),)
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(userProvider.user.toString() ?? "No hay usuario"),),
          ElevatedButton(
              onPressed: () async {
                bool response = await authService.logout();
                if(response){
                  context.pushNamed(MainPage.name);
                }

              },
              child: Text("Log out"))
        ],
      ),
    );
  }
}
