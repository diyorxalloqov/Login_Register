import 'package:flutter/material.dart';
import 'package:takrorlash_umumiy/db/authDB_service.dart';
import 'package:takrorlash_umumiy/ui/auth/loginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await AuthDB().deleteAccesToken();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          },
          label: const Text("deleteAccessToken")),
    );
  }
}
