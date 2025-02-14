import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {

  static const String name = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla Principal"),),
      body: userProvider.isLoading
      ? Center(child: CircularProgressIndicator( strokeWidth: 2,),)
      : Center(child: Text(userProvider.user.toString() ?? "No hay usuario"),),
    );
  }
}
