import 'package:dio/dio.dart';

abstract class NetworkResponseConfig {
  NetworkResponseConfig();
}

class NetworkResponseSucces<Model> extends NetworkResponseConfig {
  Model model;
  NetworkResponseSucces(this.model);
}

class NetworkResponseError extends NetworkResponseConfig {
  String error = '';
  NetworkResponseError(this.error);
}

class NetworkResponseExeption extends NetworkResponseConfig {
  DioException exception;
  String messageForUser = '';
  NetworkResponseExeption(this.exception) {}
}
