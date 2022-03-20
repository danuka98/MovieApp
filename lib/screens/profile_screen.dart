import 'package:flutter/material.dart';
import 'package:movieapp/styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double widthScale,heightScale,width,height;

  @override
  Widget build(BuildContext context){
  widthScale = MediaQuery.of(context).size.width / 100;
  heightScale = MediaQuery.of(context).size.height / 100;
  width = MediaQuery.of(context).size.width;
  height = MediaQuery.of(context).size.height;

  return Scaffold(
      appBar: AppBar(
        backgroundColor: kDark,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: widthScale * 5
            ),
            child: Icon(Icons.edit,size: widthScale * 5,color: kWhite,),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kDark,
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: kGrey.withOpacity(0.2),
              radius: 80,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/cover3.jpg"),
                radius: 70,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: heightScale * 3
            ),
            child: Text(
              'Danuka Dilshan',
              style: TextStyle(
                color: kWhite,
                fontSize: widthScale * 4,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: heightScale * 1
            ),
            child: Text(
              'dnkdilshan@gmail.com',
              style: TextStyle(
                color: kWhite,
                fontSize: widthScale * 4,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
        ],
      ),
    );
  }
}
