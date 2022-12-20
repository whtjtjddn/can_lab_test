

import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:testCoding/function/api_func.dart';
import 'package:testCoding/model/user_model.dart';

class AuthFunction extends GetxService {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  final api = Get.find<ApiFunction>();

  Future<AuthFunction> init() async {
    return this;
  }

  UserModel? user;

  Future<bool> login() async {
    final loginData = {
      "user_id": "tester",
      "user_pw": "abcd1234"
    };

    try {
      final res = await api.dio.get('/auth', queryParameters: loginData);
      user = UserModel.fromJson(jsonDecode(res.data)['result']);
      return true;
    } catch(exception) {
      logger.e(exception.toString());
      Get.snackbar("로그인 알림", "로그인에 실패하였습니다.");
      return false;
    }
  }
}
