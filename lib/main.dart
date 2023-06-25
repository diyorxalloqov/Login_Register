import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:takrorlash_umumiy/provider/auth/login_provider.dart';
import 'package:takrorlash_umumiy/provider/auth/register_provider.dart';
import 'package:takrorlash_umumiy/ui/splashPage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => RegistrProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => LoginProvider()),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}
