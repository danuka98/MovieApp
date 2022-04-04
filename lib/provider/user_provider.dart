import 'package:flutter/material.dart';
import 'package:movieapp/model/user_details.dart';
import 'package:movieapp/service/user_service.dart';

class UserProvider with ChangeNotifier{
  UserDetails userDetails = UserDetails();
  bool isLoading = false;

  getUserDetails(String userName, String password) async{
    isLoading = true;
    userDetails = await UserService.SignIn(userName, password);
    isLoading = false;
    notifyListeners();
  }
}