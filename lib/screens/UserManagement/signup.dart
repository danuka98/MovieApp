import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/model/user_details.dart';
import 'package:movieapp/styles/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  late double widthScale,heightScale,width,height;


  Future _Singup() async {
    var url = Uri.parse(
        'https://car-rentalsystem-backend.herokuapp.com/api/v1/user/signup');

    var body = json.encode(<String, String>{
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    });

    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json; charset=utf-8"
        },
        body: body,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        User userDetails = User.fromJson(responseBody);
        print(responseBody);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        decoration:  BoxDecoration(
          image: DecorationImage(
              colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
              image: AssetImage('images/image1.jpeg'),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(
                  top: heightScale * 15
                ),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: widthScale * 6,
                  right: widthScale * 6,
                  top: heightScale * 15
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: kGrey.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: BorderBottom(),
                            ),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  firstName = val;
                                });
                              },
                              style: const TextStyle(color: kWhite),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "First Name",
                                  hintStyle: TextStyle(color: kWhite)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: BorderBottom(),
                            ),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  lastName = val;
                                });
                              },
                              style: const TextStyle(color: kWhite),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Last Name",
                                  hintStyle: TextStyle(color: kWhite)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: BorderBottom(),
                            ),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  email = val;
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
                    SizedBox(
                      height: heightScale * 8,
                    ),
                    GestureDetector(
                      onTap: (){
                        _Singup();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              kDarkGrey,
                              kWhite,
                            ])),
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: const Text(
                        "Already Have Account?",
                        style: TextStyle(
                          color: kWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // BoxShadow InputBoxShadow() {
  //   return const BoxShadow(
  //       color: Color.fromRGBO(143, 148, 251, .2),
  //       blurRadius: 20.0,
  //       offset: Offset(0, 10));
  // }

  Border BorderBottom() {
    return  Border(
        bottom: BorderSide(color: kWhite.withOpacity(0.5)));
  }
}
