import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/service/sharedPref.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:http/http.dart' as http;

import '../../model/pmovie_details.dart';

class PurchaseDetails extends StatefulWidget {
  const PurchaseDetails({Key? key}) : super(key: key);

  @override
  _PurchaseDetailsState createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {

  SharedPref sharedPref = SharedPref();

  getToken() async {
    String token = await sharedPref.read("token");
    return token;
  }

  Future _getUserData() async {
    var url = Uri.parse(
        'https://car-rentalsystem-backend.herokuapp.com/api/v1/user/profile');

    String token = getToken().toString();

    try {
      final response = await http.get(
          url,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8"
          }
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        PMovieDetails userDetails = PMovieDetails.fromJson(responseBody);
        print("Success");
      }
    } catch (e) {
      print(e);
    }
  }

  List purchaseMovie = [
    {
      "image":
          "https://res.cloudinary.com/dx7npz85q/image/upload/v1648806269/action/batman_ph5s8t.jpg",
      "price": "\$150",
      "name": "The Batman",
    },
    {
      "image":
          "https://res.cloudinary.com/dx7npz85q/image/upload/v1648806245/action/the_adam_project_syrenk.jpg",
      "price": "\$120",
      "name": "The Adam Project",
    },
    {
      "image":
          "https://res.cloudinary.com/dx7npz85q/image/upload/v1648806247/action/Spider-Man_No_Way_Home_vwvhi1.jpg",
      "price": "\$130",
      "name": "Spider-Man: No Way Home",
    },
    {
      "image":
          "https://res.cloudinary.com/dx7npz85q/image/upload/v1648806274/action/Black_Crab_f3tk8a.jpg",
      "price": "\$170",
      "name": "Black Crab",
    },
    {
      "image":
          "https://res.cloudinary.com/dx7npz85q/image/upload/v1648806293/action/The_Lost_City_hrs9j6.jpg",
      "price": "\$160",
      "name": "The Lost City",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
            color: kWhite,
          ),
          tooltip: 'Logout',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Purchase Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kDark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: purchaseMovie.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 600,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white.withOpacity(0.5),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.6),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      purchaseMovie[index]["image"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${purchaseMovie[index]["price"]}",
                                    style: TextStyle(
                                        color: kDark,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "${purchaseMovie[index]["name"]}",
                                      style:
                                          TextStyle(color: kDark, fontSize: 25),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.5),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.dstATop),
                            image: NetworkImage(purchaseMovie[index]["image"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${purchaseMovie[index]["price"]}",
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${purchaseMovie[index]["name"]}",
                                style: TextStyle(color: kWhite, fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

//
