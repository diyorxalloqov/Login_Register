import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takrorlash_umumiy/provider/auth/register_provider.dart';

class RegistrPage extends StatelessWidget {
  const RegistrPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrProvider provider = Provider.of<RegistrProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => RegistrProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Registr"),
          ),
          body: Column(
            children: [
              TextFormField(
                controller: provider.fnameController,
                decoration: const InputDecoration(
                    hintText: "First Name", border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: provider.lnameController,
                decoration: const InputDecoration(
                    hintText: "Last name", border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: provider.emailController,
                decoration: const InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: provider.passwordController,
                decoration: const InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              provider.register(context);
            },
            label: const Text("Registr"),
          ),
        );
      },
    );
  }
}
