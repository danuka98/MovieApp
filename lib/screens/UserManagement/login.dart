import 'package:flutter/material.dart';
import 'package:movieapp/provider/user_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/model/user_details.dart';
import 'package:movieapp/service/sharedPref.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String userName = "";
  String password = "";
  late double widthScale,heightScale,width,height;

  // getUserDetails() async{
  //   final provider = Provider.of<UserProvider>(context, listen: false);
  //   await provider.getUserDetails(userName, password);
  // }

  SharedPref sharedPref = SharedPref();

  Future _SingIn() async {
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
        UserDetails userDetails = UserDetails.fromJson(responseBody);
        var token = userDetails.token;
        sharedPref.save("token", token);
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      print(e);
    }
  }

  _printData() {
    print(userName + " " + password);
  }

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kWhite.withOpacity(0.5),
      body: Container(
        height: height,
        decoration:  BoxDecoration(
          image: DecorationImage(
              colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: AssetImage('images/image1.jpeg'),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(
                  top: heightScale * 20
                ),
                child: Container(
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(
                  left: widthScale * 5,
                  right: widthScale * 5,
                  top: heightScale * 15
                ),
                child: Container(
                  padding: EdgeInsets.all(widthScale * 2),
                  decoration: BoxDecoration(
                      color: kGrey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [InputBoxShadow()]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(border: BorderBottom()),
                        child: TextField(
                          onChanged: (val) {
                            setState(() {
                              userName = val;
                            });
                          },
                          style: const TextStyle(color: kWhite),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or Phone number",
                              hintStyle: TextStyle(color: kWhite)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          style: const TextStyle(color: kWhite),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: kWhite)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
               SizedBox(
                height: heightScale * 10,
              ),
              Padding(
                padding:  EdgeInsets.only(
                  left: widthScale * 5,
                  right: widthScale * 5,
                ),
                child: GestureDetector(
                  onTap: (){
                    _SingIn();
                  },
                  child: Container(
                    height: heightScale * 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(colors: [
                          kDarkGrey,
                          kWhite,
                        ])),
                    child:  Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: widthScale * 5,
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightScale * 15,
              ),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
                  child:  Text(
                    "Don't you have a Account? Sign Up",
                    style: TextStyle(color: kWhite,fontSize: widthScale * 4),
                  ),)
            ],
          ),
        ),
      ),
    );
  }

  Border BorderBottom() {
    return  Border(
        bottom: BorderSide(color: kWhite.withOpacity(0.5)));
  }

  BoxShadow InputBoxShadow() {
    return const BoxShadow(
        color: Color.fromRGBO(143, 148, 251, .2),
        blurRadius: 20.0,
        offset: Offset(0, 10));
  }
}
