class UserDetails {
  bool? success;
  String? token;
  User? user;

  UserDetails({this.success, this.token, this.user});

  UserDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  Avatar? avatar;
  String? role;
  bool? verifiedAccount;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? birthday;
  int? phoneNumber;
  String? createdAt;

  User(
      {this.avatar,
      this.role,
      this.verifiedAccount,
      this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.birthday,
      this.phoneNumber,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    role = json['role'];
    verifiedAccount = json['verifiedAccount'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    birthday = json['birthday'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    data['role'] = this.role;
    data['verifiedAccount'] = this.verifiedAccount;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birthday'] = this.birthday;
    data['phoneNumber'] = this.phoneNumber;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Avatar {
  String? publicId;
  String? url;

  Avatar({this.publicId, this.url});

  Avatar.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}
