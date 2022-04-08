import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/screens/bottom_nav_screen.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:readmore/readmore.dart';
import 'review_screen.dart';

class MovieInnerPage extends StatefulWidget {
  const MovieInnerPage({Key? key}) : super(key: key);

  @override
  _MovieInnerPageState createState() => _MovieInnerPageState();
}

class _MovieInnerPageState extends State<MovieInnerPage> {
  //bool isAPIcallProcess = false;
  //GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  //String?comment;
  late double widthScale, heightScale, width, height;
  List purchaseMovie = [
    {
      "image":
      "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg",
      "username": "Janitha Tharaka",
      "comment": "This is a best movie",
    },
    {
      "image":
      "https://res.cloudinary.com/dx7npz85q/image/upload/v1648806245/action/the_adam_project_syrenk.jpg",
      "username": "Adam Smith",
      "comment": "I dont like this movie",
    },
    {
      "image":
      "https://cdn.pixabay.com/photo/2017/08/01/01/33/beanie-2562646__340.jpg",
      "username": "Kalana Janith",
      "comment": "I hate this movies",
    },
    {
      "image":
      "https://cdn.pixabay.com/photo/2018/04/27/03/50/portrait-3353699__340.jpg",
      "username": "Deshan Chameera",
      "comment": "This is a great movie",
    },
    {
      "image":
      "https://cdn.pixabay.com/photo/2016/11/23/00/57/adult-1851571__340.jpg",
      "username": "Chamith Akalanka",
      "comment": "One of the best movie i have ever seen",
    },
  ];
  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    String text = "Action";

    return Scaffold(
      backgroundColor: kDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: height / 1.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/cover2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: heightScale * 5, left: widthScale * 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BottomNavScreen()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: kWhite.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(widthScale * 15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(widthScale * 2),
                          child: Icon(
                            Icons.close,
                            size: widthScale * 7,
                            color: kWhite,
                          ),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: heightScale * 20),
                    child: Container(
                      width: widthScale * 45,
                      height: widthScale * 60,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("images/cover2.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(widthScale * 5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: heightScale * 55, left: widthScale * 5),
                  child: Text(
                    'Avengers infinity war Avengers infinity war',
                    style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: widthScale * 6,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  color: kWhite,
                  size: widthScale * 7,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: widthScale * 8,
                    right: widthScale * 8,
                  ),
                  child: Text(
                    '7.8',
                    style: TextStyle(
                        fontSize: widthScale * 5,
                        color: kGreen,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  '2020',
                  style: TextStyle(
                      fontSize: widthScale * 5,
                      color: kGrey,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 10,
                right: widthScale * 10,
              ),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: widthScale * 6.5,
                    crossAxisSpacing: widthScale * 2,
                    mainAxisSpacing: widthScale * 2,
                  ),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kWhite),
                        borderRadius: BorderRadius.circular(widthScale * 2),
                      ),
                      child: Center(
                        child: Text(
                          'Action',
                          style: TextStyle(
                            color: kWhite,
                            fontSize: widthScale * 3,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 4,
                right: widthScale * 4,
                top: heightScale * 4,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(widthScale * 1.5),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: heightScale * 1,
                    bottom: heightScale * 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow_outlined,
                        color: kDark.withOpacity(0.5),
                        size: widthScale * 9,
                      ),
                      Text(
                        'Watch Trailer',
                        style: TextStyle(
                          fontSize: widthScale * 5,
                          color: kDark,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 4,
                right: widthScale * 4,
                top: heightScale * 2,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: kGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(widthScale * 1.5),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: heightScale * 1.5,
                    bottom: heightScale * 1.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: kWhite.withOpacity(0.5),
                        size: widthScale * 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: widthScale * 3),
                        child: Text(
                          'Add to Favorite',
                          style: TextStyle(
                            fontSize: widthScale * 4.5,
                            color: kWhite,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: widthScale * 4, top: widthScale * 5),
              child: Text(
                'Details',
                style: TextStyle(
                  fontSize: widthScale * 5,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widthScale * 4,
                  right: widthScale * 4,
                  top: widthScale * 6),
              child: ReadMoreText(
                'Tubi TV has a catalog of free movies, neatly sorted into categories by genre, like horror, romance, and comedy. You can also browse through featured and most popular movies. As far as the movies go, theyre high quality, and the movie player works smoothly.As a bonus, all the films have subtitles available. Logging in will give you the option to add movies to your queue, which is accessible across devices, and even on the web version of Tubi TV. You also get an option for screencasting.',
                style: TextStyle(
                  fontSize: widthScale * 4,
                  color: kWhite,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.justify,
                colorClickableText: kBlue,
                trimExpandedText: "Show less",
                trimCollapsedText: "Read more",
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: widthScale * 4, top: widthScale * 5),
              child: Text(
                'Director : ',
                style: TextStyle(
                  fontSize: widthScale * 4,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: widthScale * 4, top: widthScale * 5),
              child: Text(
                'Cast : ',
                style: TextStyle(
                  fontSize: widthScale * 4,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: heightScale * 5),
                child: Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: kWhite,
                      size: widthScale * 8,
                    ),
                    Text(
                      'Share',
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w300,
                          fontSize: widthScale * 4),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widthScale * 4,
                  right: widthScale * 4,
                  top: heightScale * 4),
              child: Divider(
                thickness: widthScale * 0.1,
                color: kGrey,
              ),
            ),

            ///Rate & Review
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 4,
                top: heightScale * 4,
                bottom: heightScale * 3,
              ),
              child: Text(
                'Rate & Review',
                style: TextStyle(
                  fontSize: widthScale * 5,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: RatingBar.builder(
                unratedColor: kGrey.withOpacity(0.2),
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: kAmber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),

            //this is my area(Tharaka)
            SizedBox(
              height: height,
              child:  ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: widthScale * 5,
                    );
                  },
                  itemCount: purchaseMovie.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding:  EdgeInsets.only(
                        left: widthScale*5,
                        right: widthScale*5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kWhite.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(widthScale*5)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(
                                left: widthScale*2,
                                right: widthScale*3,
                                top: heightScale*1,
                                bottom: heightScale*3,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(purchaseMovie[index]['image']),
                                radius: 25,
                              ),
                            ),
                            SizedBox(
                              width: widthScale*65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      top: heightScale*1,
                                      bottom: heightScale*1.5,
                                    ),
                                    child: Text(
                                      purchaseMovie[index]['username'],
                                      style: TextStyle(
                                        color: kWhite,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Text(
                                      purchaseMovie[index]['comment'],
                                    style: TextStyle(
                                        color: kWhite
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
                                      FlatButton(
                                        textColor: const Color(0xFF6200EE),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context){
                                                return AlertDialog(

                                                  title: Text('Update Your Comment'),

                                                  content: TextField(

                                                    onChanged: (value) { },

                                                    //controller: _textFieldController,

                                                    decoration: InputDecoration(hintText: "Update Your Comment"),

                                                  ),
                                                  actions: <Widget>[

                                                    FlatButton(

                                                      color: Colors.green,

                                                      textColor: Colors.white,

                                                      child: Text('UPDATE'),

                                                      onPressed: () {

                                                        setState(() {

                                                          //codeDialog = valueText;

                                                          Navigator.pop(context);

                                                        });

                                                      },

                                                    ),

                                                  ],
                                                );
                                              }
                                          );
                                          // Perform some action
                                        },
                                        child: const Text('Edit'),
                                      ),
                                      FlatButton(
                                        textColor: const Color(0xFF6200EE),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            Row(
              children: [
                Container(
                  width: widthScale*85,
                  child: const TextField(
                    style: TextStyle(
                      color: kWhite,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add your review',
                      hintStyle: TextStyle(
                        color: kWhite,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.send,color: Colors.white,)

                ),


              ],
            ),

            SizedBox(
              height: heightScale * 5,
            ),
          ],
        ),
      ),
    );
  }
}
