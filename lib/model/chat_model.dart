class ChatModel {
  List<ChatData>? chatData;

  ChatModel({this.chatData});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      chatData = <ChatData>[];
      json['result'].forEach((v) {
        chatData!.add(ChatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chatData != null) {
      data['result'] = chatData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatData {
  int? roomId;
  List<ConnectUsers>? connectUsers;
  List<Chats>? chats;

  ChatData({this.roomId, this.connectUsers, this.chats});

  ChatData.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    if (json['connect_users'] != null) {
      connectUsers = <ConnectUsers>[];
      json['connect_users'].forEach((v) {
        connectUsers!.add(ConnectUsers.fromJson(v));
      });
    }
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    if (connectUsers != null) {
      data['connect_users'] =
          connectUsers!.map((v) => v.toJson()).toList();
    }
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConnectUsers {
  String? userName;
  int? userId;
  String? userDesc;
  String? profileUrl;

  ConnectUsers({this.userName, this.userId, this.userDesc, this.profileUrl});

  ConnectUsers.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userId = json['user_id'];
    userDesc = json['user_desc'];
    profileUrl = json['profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['user_id'] = userId;
    data['user_desc'] = userDesc;
    data['profile_url'] = profileUrl;
    return data;
  }
}

class Chats {
  int? id;
  int? userId;
  String? text;
  int? date;

  Chats({this.id, this.userId, this.text, this.date});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    text = json['text'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['text'] = text;
    data['date'] = date;
    return data;
  }
}
