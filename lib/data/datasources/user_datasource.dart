import 'dart:convert';

import 'package:cleanoauth2/singleton.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class UserDatasource{

  final http.Client client;
  final String baseUrl = "https://ggce-api1.alliance.cgiar.org/";

  UserDatasource({required this.client});

  Future<User> getUser() async {
    final Map<String, String> headers = {
      'Authorization': Singleton.token!,
      'Content-Type': 'application/json',
    };
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/me/user"), headers: headers);
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body)).toEntity();
    } else {
      throw Exception("Error al obtener el usuario");
    }
  }
}