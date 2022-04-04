import 'dart:convert';

import 'package:movieapp/model/user_details.dart';
import 'package:movieapp/utils/base.dart';
import 'package:http/http.dart' as http;


class UserService{

  static SignIn(String userName, String password) async {
    var url = Uri.parse(
        'https://car-rentalsystem-backend.herokuapp.com/api/v1/user/signin');

    var body = json.encode(<String, String>{"email": userName, "password": password});

    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json; charset=utf-8"
        },
        body: body,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        User userDetails = User.fromJson(responseBody);
        print(responseBody);
      }
    } catch (e) {
      print(e);
    }
  }
}