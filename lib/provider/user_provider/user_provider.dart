import 'package:flutter/material.dart';
import '../../core/helper/shared_check_helper.dart';
import '../../firebase/firestore/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentUser;

  Future<void> initUser() async {
    final userData = await SharedCheckHelper.getUserData();
    if (userData['id'] != null) {
      currentUser = UserModel(
        id: userData['id']!,
        name: userData['name'] ?? '',
        email: userData['email'] ?? '',
      );
      notifyListeners();
    }
  }

  void changeCurrentUser(UserModel newUser) async {
    currentUser = newUser;
    await SharedCheckHelper.setUserData(
      id: newUser.id,
      name: newUser.name,
      email: newUser.email,
    );
    notifyListeners();
  }
}
