import 'package:can_lab_test/model/chat_model.dart';
import 'package:can_lab_test/modules/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatDetail extends GetView<ChatController> {
  List<Chats>? chatting = [];

  ChatDetail({Key? key, required this.chatting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              '채팅방',
            ),
          ),
          body: ListView.builder(
                  itemCount: chatting!.length,
                  itemBuilder: (_, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      child: Row(
                          mainAxisAlignment: controller.isMyChat(chatting![index].userId!)
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: controller.isMyChat(chatting![index].userId!)
                              ? _buildMyChatContainer(index)
                              : _buildOtherChatContainer(index)),
                    );
                  })),
    );
  }
  _buildMyChatContainer(int index) {
    return  [
      Text(controller.timeStampToJmString(chatting![index].date!)),
      const SizedBox(width: 4.0),
      Container(
        constraints: BoxConstraints(
            minWidth: 0, maxWidth: Get.width / 1.5),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: const BorderRadius.all(
              Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(12),
        child: Text(
          '${chatting![index].text}',
          style: const TextStyle(height: 1.3),
          overflow: TextOverflow.clip,
        ),
      ),
    ];
  }
  _buildOtherChatContainer(int index) {
    return [
      Container(
        constraints: BoxConstraints(
            minWidth: 0, maxWidth: Get.width / 1.5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(
              Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(12),
        child: Text(
          '${chatting![index].text}',
          style: const TextStyle(height: 1.3),
          overflow: TextOverflow.clip,
        ),
      ),
      const SizedBox(width: 4.0),
      Text(controller.timeStampToJmString(chatting![index].date!)),
    ];
  }
}
