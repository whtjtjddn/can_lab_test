class UserModel {
  String? userName;
  int? userId;
  String? userDesc;
  String? profileUrl;

  UserModel({this.userName, this.userId, this.userDesc, this.profileUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userId = json['user_id'];
    userDesc = json['user_desc'];
    profileUrl = json['profile_url'];
  }
}
