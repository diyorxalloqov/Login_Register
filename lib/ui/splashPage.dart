import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:takrorlash_umumiy/db/authDB_service.dart';
import 'package:takrorlash_umumiy/ui/HomePage.dart';
import 'package:takrorlash_umumiy/ui/auth/loginPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => checkAccesToken(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash"),
      ),
      body: const Center(
        child: Text("SplashPage"),
      ),
    );
  }

  void checkAccesToken(BuildContext context) async {
    await AuthDB().openbox();

    String? accesToken = await Hive.box("authBox").get("access_token");
    if (accesToken != null && accesToken.isNotEmpty) {
      //Home
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } 
    else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    }
  }
}
