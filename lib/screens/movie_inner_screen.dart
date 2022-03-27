import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/screens/bottom_nav_screen.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:readmore/readmore.dart';

class MovieInnerPage extends StatefulWidget {
  const MovieInnerPage({Key? key}) : super(key: key);

  @override
  _MovieInnerPageState createState() => _MovieInnerPageState();
}

class _MovieInnerPageState extends State<MovieInnerPage> {
  late double widthScale,heightScale,width,height;

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    List<String> text = ["Action","Drama","Horror","Comedy","Sci-fi","Horror","Comedy","Sci-fi"];

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
                    child:  Container(
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: heightScale * 5,
                    left: widthScale * 5
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const BottomNavScreen())
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kWhite.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(widthScale * 15),
                      ),
                        child: Padding(
                          padding: EdgeInsets.all(widthScale * 2),
                          child: Icon(Icons.close,size: widthScale * 7,color: kWhite,),
                        )
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: heightScale * 20
                    ),
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
                      top: heightScale * 55,
                      left: widthScale * 5
                  ),
                  child: Text(
                    'Avengers infinity war Avengers infinity war',
                    style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: widthScale * 6,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite,color: kWhite,size: widthScale * 7,),
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
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Text(
                  '2020',
                  style: TextStyle(
                    fontSize: widthScale * 5,
                    color: kGrey,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
            // Padding(
            //   padding:  EdgeInsets.only(
            //     left: widthScale * 10,
            //     right: widthScale * 10,
            //   ),
            //   child: GridView.builder(
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3,
            //         mainAxisExtent: widthScale * 6.5,
            //         crossAxisSpacing: widthScale*2,
            //         mainAxisSpacing: widthScale*2,
            //       ),
            //       itemCount: 5,
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: (BuildContext context, int index){
            //         return Container(
            //           decoration: BoxDecoration(
            //             border: Border.all(color: kWhite),
            //             borderRadius: BorderRadius.circular(widthScale * 2),
            //           ),
            //           child: Center(
            //             child: Text(
            //               'Action',
            //               style: TextStyle(
            //                 color: kWhite,
            //                 fontSize: widthScale * 3,
            //                 fontWeight: FontWeight.w300,
            //               ),
            //             ),
            //           ),
            //         );
            //       }
            //   ),
            // ),
            Padding(
              padding:  EdgeInsets.only(
                top: heightScale * 3,
                left: widthScale * 10,
                right: widthScale * 10,
              ),
              child: Wrap(
                children: [
                  ...text.map((e) => Container(
                    margin: EdgeInsets.symmetric(horizontal: widthScale * 1,vertical: widthScale * 1),
                    decoration: BoxDecoration(
                      border: Border.all(color: kWhite),
                      borderRadius: BorderRadius.circular(widthScale * 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(widthScale * 1.5),
                      child: Text(
                        e,
                        style: TextStyle(
                          color: kWhite,
                          fontSize: widthScale * 3,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )).toList(),
                ]
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
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
                      Icon(Icons.play_arrow_outlined,color: kDark.withOpacity(0.5),size: widthScale * 9,),
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
              padding:  EdgeInsets.only(
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
                      Icon(Icons.add_circle_outline,color: kWhite.withOpacity(0.5),size: widthScale * 6,),
                      Padding(
                        padding: EdgeInsets.only(
                          left: widthScale * 3
                        ),
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
              padding: EdgeInsets.only(
                left: widthScale * 4,
                top: widthScale * 5
              ),
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
                top: widthScale * 6
              ),
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
              padding: EdgeInsets.only(
                  left: widthScale * 4,
                  top: widthScale * 5
              ),
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
              padding: EdgeInsets.only(
                  left: widthScale * 4,
                  top: widthScale * 5
              ),
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
                padding: EdgeInsets.only(
                  top: heightScale * 5
                ),
                child: Column(
                  children: [
                    Icon(Icons.share,color: kWhite,size: widthScale * 8,),
                    Text(
                      'Share',
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w300,
                        fontSize: widthScale * 4
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
                left: widthScale * 4,
                right: widthScale * 4,
                top: heightScale * 4
              ),
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
            SizedBox(
              height: heightScale * 10,
            ),
          ],
        ),
      ),
    );
  }
}
