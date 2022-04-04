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
      {this.role,
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
