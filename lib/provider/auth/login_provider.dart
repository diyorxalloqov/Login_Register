import 'package:flutter/material.dart';
import 'package:takrorlash_umumiy/db/authDB_service.dart';
import 'package:takrorlash_umumiy/models/auth/authModel.dart';
import 'package:takrorlash_umumiy/service/auth_service.dart';
import 'package:takrorlash_umumiy/ui/HomePage.dart';

class LoginProvider extends ChangeNotifier {
  AuthService authService = AuthService();
  AuthDB authDB = AuthDB();

  // Inputs
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String error = '';

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    dynamic response = await authService.login(
        email: emailController.text, password: passwordController.text);
    if (response is AuthModel) {
      isLoading = false;
      await authDB.writeToDB(response.accesToken.toString());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
      isLoading = false;
      error = response;
      notifyListeners();
    }
  }
}
