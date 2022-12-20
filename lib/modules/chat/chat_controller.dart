import 'dart:convert';

import 'package:can_lab_test/function/api_func.dart';
import 'package:can_lab_test/function/auth_func.dart';
import 'package:can_lab_test/model/chat_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatController extends GetxController {
  final api = Get.find<ApiFunction>();
  final auth = Get.find<AuthFunction>();
  Rx<ChatModel?> chatData = ChatModel().obs;

  @override
  void onInit() async {
    await auth.login();
    chatData.value = await getChatData();
    super.onInit();
  }

  Future<ChatModel> getChatData() async {
    final userData = {"user_id": auth.user!.userId};
    final chatResponse = await api.dio.get('/chatList', queryParameters: userData);
    return ChatModel.fromJson(jsonDecode(chatResponse.data));
  }

  String getConnectedUserString(List<ConnectUsers> connectUsers) {
    String connectUserString = '';
    for (var user in connectUsers) {
      if(user == connectUsers.last) {
        connectUserString += '${user.userName}';
        break;
      }
      connectUserString += '${user.userName},';
    }
    return connectUserString;
  }

  String getConnectedUserDescString(List<ConnectUsers> connectUsers) {
    String connectUserDescString = '';
    for (var user in connectUsers) {
      if(user == connectUsers.last) {
        connectUserDescString += '${user.userDesc}';
        break;
      }
      connectUserDescString += '${user.userDesc},';
    }
    return connectUserDescString;
  }

  String timeStampToJmString(int timeStamp) {
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
  }

  bool isMyChat(int checkUserId) {
    return checkUserId == auth.user!.userId;
  }
}
