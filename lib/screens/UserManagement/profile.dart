import 'package:flutter/material.dart';
import 'package:movieapp/screens/UserManagement/purchase_details.dart';
import 'dart:convert';
import 'package:movieapp/service/sharedPref.dart';
import 'package:http/http.dart' as http;
import '../../model/user_details.dart';
import '../../styles/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late double widthScale, heightScale, width, height;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  bool isTap = false;

  var firstName = "Shehan";
  var lastName = "Dhanuddara";
  var email = "shehan.dhanuddara1998@gmail.com";
  var password = "shehan123";
  var mobileNumber = "0765207513";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();

    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    logout() async {
      print("works");
      await sharedPref.remove("token");
      if (sharedPref.read("token") != null) {
        await sharedPref.remove("token");
      }
      if (await sharedPref.read("token") == null) {
        Navigator.pushNamed(context, '/signin');
      }
    }

    getToken() async {
      String token = await sharedPref.read("token");
      print(token);
      return token;
    }

    Future _getUserData() async {
      var url = Uri.parse(
          'https://car-rentalsystem-backend.herokuapp.com/api/v1/user/profile');

      String token = getToken().toString();
      print(token);

      try {
        final response = await http.get(
          url,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8"
          }
        );

        print(response.statusCode);
        print(response);
        // Map<String, dynamic> responseBody = json.decode(response.body);
        // print(responseBody);

        if (response.statusCode == 200) {
          // Map<String, dynamic> responseBody = json.decode(response.body);
          // UserDetails userDetails = UserDetails.fromJson(responseBody);
          print("Success");
        }
      } catch (e) {
        print(e);
      }
    }

    // _getUserData();

    return Scaffold(
      backgroundColor: kDark,
      appBar: AppBar(
        backgroundColor: kDark,
        centerTitle: true,
        title: const Text(
          'PROFILE',
          style: TextStyle(
              fontSize: 18, color: kWhite, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: widthScale * 5),
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                size: 26,
                color: kWhite,
              ),
              tooltip: 'Logout',
              onPressed: () {
                logout();
              },
            ),
            //
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250.0,
              color: kDark,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('images/as.png'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 90.0, right: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                            radius: 25.0,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                ]),
              ),
            ),
            Container(
              color: kDark,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Text(
                                  'Parsonal Information',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _status ? _getEditIcon() : Container(),
                              ],
                            )
                          ],
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                style: const TextStyle(color: kWhite),
                                decoration: InputDecoration(
                                  hintText: firstName + " " + lastName,
                                  hintStyle:
                                      TextStyle(color: kWhite.withOpacity(0.5)),
                                ),
                                enabled: !_status,
                                autofocus: !_status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Text(
                                  'Email ID',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                style: const TextStyle(color: kWhite),
                                decoration: InputDecoration(
                                  hintText: email,
                                  hintStyle:
                                      TextStyle(color: kWhite.withOpacity(0.5)),
                                ),
                                enabled: !_status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Text(
                                  'Mobile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              style: const TextStyle(color: kWhite),
                              decoration: InputDecoration(
                                hintText: mobileNumber,
                                hintStyle:
                                    TextStyle(color: kWhite.withOpacity(0.5)),
                              ),
                              enabled: !_status,
                              onChanged: (val) {
                                mobileNumber = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    !_status ? _getActionButtons() : Container(),
                  ],
                ),
              ),
            ),
            _status
                ? Padding(
                    padding: EdgeInsets.only(
                      left: widthScale * 15,
                      right: widthScale * 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PurchaseDetails()),
                        );
                      },
                      child: Container(
                        height: heightScale * 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              kDarkGrey,
                              kWhite,
                            ])),
                        child: Center(
                          child: Text(
                            "Purchase History",
                            style: TextStyle(
                                fontSize: widthScale * 4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    child: RaisedButton(
                      child: Text("Save"),
                      textColor: kDark,
                      color: kWhite,
                      onPressed: () {
                        setState(
                          () {
                            _status = true;
                            FocusScope.of(context).requestFocus(
                              FocusNode(),
                            );
                          },
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RaisedButton(
                    child: const Text("Cancel"),
                    textColor: Colors.white,
                    color: kGrey.withOpacity(0.2),
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
