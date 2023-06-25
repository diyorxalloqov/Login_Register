import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AuthDB {
  Box? authbox;

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    authbox = await Hive.openBox("Authbox");
    debugPrint(authbox!.length.toString());
  }

  Future<void> writeToDB(String token) async {
    await openbox();
    await authbox!.put("access_token", token);
    debugPrint(authbox!.length.toString());
  }

  Future<void> deleteAccesToken() async {
    await openbox();
    await authbox!.delete("access_token");
    debugPrint(authbox!.length.toString());
  }
}
