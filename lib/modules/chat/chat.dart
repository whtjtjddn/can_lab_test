
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testCoding/modules/chat/chat_controller.dart';
import 'package:testCoding/modules/chat/chat_detail.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.chatData.value!.chatData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: controller.chatData.value!.chatData!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => ChatDetail(chatting: controller.chatData.value!.chatData![index].chats));
                      },
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(12)),
                          child: Image.network(
                              '${controller.chatData.value!.chatData![index].connectUsers![0].profileUrl}', fit: BoxFit.fill),
                        ),
                      ),
                      title: Text(
                        controller.getConnectedUserString(controller.chatData.value!.chatData![index].connectUsers!),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                controller.getConnectedUserDescString(controller.chatData.value!.chatData![index].connectUsers!),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            '${controller.chatData.value!.chatData![index].chats!.last.text}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
      ),
    );
  }
}
