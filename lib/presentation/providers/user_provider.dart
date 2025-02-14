import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository userRepository;
  bool isLoading = true;
  User user = User();

  UserProvider({required this.userRepository});

  Future<void> getUser() async {
    final result = await userRepository.getUser();
    result.fold((failure) {
      print(failure.message);
    }, (user) {
      print(user.username);
      this.user = user;
      isLoading = false;
      notifyListeners();
    });
  }
}
