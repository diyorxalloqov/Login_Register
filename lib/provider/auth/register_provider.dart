import 'package:flutter/material.dart';
import 'package:takrorlash_umumiy/db/authDB_service.dart';
import 'package:takrorlash_umumiy/models/auth/authModel.dart';
import 'package:takrorlash_umumiy/service/auth_service.dart';
import 'package:takrorlash_umumiy/ui/HomePage.dart';

class RegistrProvider extends ChangeNotifier {
  AuthService authService = AuthService();
  AuthDB authDB = AuthDB();

  // Inputs
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String error = '';
  Future<void> register(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    dynamic response = await authService.register(
        email: emailController.text,
        password: passwordController.text,
        fname: fnameController.text,
        lname: lnameController.text);
    if (response is AuthModel) {
      isLoading = false;
      await authDB.writeToDB(response.accesToken.toString());
      // navigatorpushandremoveuntil qilib homepage otiladi
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
      notifyListeners();
    } else {
      isLoading = false;
      error = response;
      notifyListeners();
    }
  }
}
