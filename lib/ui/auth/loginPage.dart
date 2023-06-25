// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takrorlash_umumiy/provider/auth/login_provider.dart';
import 'package:takrorlash_umumiy/ui/auth/registirPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  GlobalKey<FormState> controllerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);

    double m_h = MediaQuery.of(context).size.height;
    double m_w = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: m_h,
            width: m_w,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(m_h * 0.045),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "Sign in",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: controllerKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: provider.emailController,
                            // write the default name of server   email ====  d@gmail.com
                            decoration: InputDecoration(
                                errorText: provider.error.isNotEmpty
                                      ? provider.error
                                      : null,
                                border: const OutlineInputBorder(),
                                hintText: "Email",
                                hintStyle: const TextStyle(fontSize: 20)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Bo'sh qoldirmang";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              controller: provider.passwordController,
                              // write the default name of server   password ====  12345
                              decoration: InputDecoration(
                                  errorText: provider.error.isNotEmpty
                                      ? provider.error
                                      : null,
                                  border: const OutlineInputBorder(),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(fontSize: 20)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Bo'sh qoldirmang";
                                } else {
                                  return null;
                                }
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        )),
                    SizedBox(
                      height: m_h * 0.0001,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              // agar access token mavjud bolmasa register page ga otiladi
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegistrPage()),
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    SizedBox(
                      height: m_h * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controllerKey.currentState!.validate()) {
                          provider.login(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(m_w * 0.9, m_h * 0.07),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30)))),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
