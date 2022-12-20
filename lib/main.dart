
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testCoding/function/api_func.dart';
import 'package:testCoding/function/auth_func.dart';
import 'package:testCoding/modules/chat/chat.dart';
import 'package:testCoding/modules/chat/chat_controller.dart';
import 'package:testCoding/routes.dart';

void main() async {
  await Get.putAsync(() => ApiFunction().init());
  await Get.putAsync(() => AuthFunction().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //첫 라우팅 페이지
      initialRoute: Routes.chat,
      getPages: [
        GetPage(
            name: Routes.chat,
            page: () => const ChatPage(),
            binding: BindingsBuilder(
                  () => {Get.put(ChatController())},
            )),
      ],
    );
  }
}


