import 'package:dio/dio.dart';
import 'package:takrorlash_umumiy/core/constants/urls.dart';
import 'package:takrorlash_umumiy/models/auth/authModel.dart';

class AuthService {
  Future<dynamic> register(
      {String? fname,
      String? lname,
      required String email,
      required String password}) async {
    try {
      Response response = await Dio().post(Urls.register, data: {
        "email": email,
        "password": password,
        "f_name": fname,
        "l_name": lname
      });
      if (response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      Response response = await Dio().post(Urls.login, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
