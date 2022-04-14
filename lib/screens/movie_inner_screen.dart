import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/model/movie_details.dart';
import 'package:movieapp/provider/movie_provider.dart';
import 'package:movieapp/screens/bottom_nav_screen.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:movieapp/utils/base.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class MovieInnerPage extends StatefulWidget {
  final String? movieID;

  const MovieInnerPage({Key? key,this.movieID}) : super(key: key);

  @override
  _MovieInnerPageState createState() => _MovieInnerPageState();
}

class _MovieInnerPageState extends State<MovieInnerPage> {
  late double widthScale,heightScale,width,height;
  bool startedPlaying = false;
  bool isFavorite = false;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieDetails();
  }

  getMovieDetails() async{
    final provider = Provider.of<MovieProvider>(context, listen: false);
    await provider.getMovieDetails(widget.movieID!);
  }

  Future addFavorite(String id) async {
    String url = '${Base.addFavorite}/$id';

      try {
        final response = await http.put(
            Uri.parse(url),
            headers: {
              "Accept": "application/json",
            },

        );
        print(response.body);
        if (response.statusCode == 200) {
          final snackBar =  SnackBar(
            content: Text(isFavorite ? 'Added to Favorite' : "Remove in Favorite"  ),
            backgroundColor: kPurple,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        print("=================throwing Exception error==================");
        print("Error: $e");
        throw Exception("Error On server");
      }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    List<String> text = ["Action","Drama","Horror","Comedy","Sci-fi","Horror","Comedy","Sci-fi"];

    return Scaffold(
      backgroundColor: kDark,
      body: Consumer<MovieProvider>(
        builder: (context,provider,child) {
          return provider.isLoading? const Center(child: CircularProgressIndicator()) :
          OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                if(orientation == Orientation.portrait){
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///back image
                        Stack(
                          children: [
                            Container(
                              width: width,
                              height: height / 1.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(provider.movieDetails.movieDetails1?.coverImage??""),
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
                                    image: DecorationImage(
                                      image: NetworkImage(provider.movieDetails.movieDetails1?.coverImage??""),
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
                              ),
                              child: Center(
                                child: Text(
                                  provider.movieDetails.movieDetails1?.movieName??"",
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: widthScale * 6,
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        ///
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite,color: isFavorite ? kRed : kWhite,size: widthScale * 7,),
                            Padding(
                              padding: EdgeInsets.only(
                                left: widthScale * 8,
                                right: widthScale * 8,
                              ),
                              child: Text(
                                "${provider.movieDetails.movieDetails1?.rate}/10",
                                style: TextStyle(
                                    fontSize: widthScale * 5,
                                    color: kGreen,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Text(
                              '${provider.movieDetails.movieDetails1?.movieYear}',
                              style: TextStyle(
                                  fontSize: widthScale * 5,
                                  color: kGrey,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),

                        ///wrap categories
                        Padding(
                          padding:  EdgeInsets.only(
                            top: heightScale * 3,
                            left: widthScale * 10,
                            right: widthScale * 10,
                          ),
                          child: Center(
                            child: Wrap(
                                children: [
                                  ...provider.movieDetails.movieDetails1!.movieCategories!.map((e) => Container(
                                    margin: EdgeInsets.symmetric(horizontal: widthScale * 1,vertical: widthScale * 1),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kWhite),
                                      borderRadius: BorderRadius.circular(widthScale * 2),
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(widthScale * 1.5),
                                      child: Text(
                                        e.catogoryName??"",
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
                        ),

                        ///watch trailer
                        Padding(
                          padding:  EdgeInsets.only(
                            left: widthScale * 4,
                            right: widthScale * 4,
                            top: heightScale * 4,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: startedPlaying ? kGreen : kWhite,
                              borderRadius: BorderRadius.circular(widthScale * 1.5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: heightScale * 1,
                                bottom: heightScale * 1,
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    startedPlaying = !startedPlaying;
                                  });
                                },
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
                        ),
                        startedPlaying ? Padding(
                          padding: EdgeInsets.only(
                            left: widthScale * 4,
                            right: widthScale * 4,
                            top: heightScale * 2,
                          ),
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  provider.movieDetails.movieDetails1?.movieTrailerLink ?? "")
                                  .toString(),
                              flags: const YoutubePlayerFlags(
                                hideControls: false,
                                controlsVisibleAtStart: true,
                                autoPlay: false,
                                mute: false,
                                enableCaption: true,
                                forceHD: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.purple,
                          ),
                        ) : Container(),

                        ///add to fav
                        Padding(
                          padding:  EdgeInsets.only(
                            left: widthScale * 4,
                            right: widthScale * 4,
                            top: heightScale * 2,
                          ),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              addFavorite(provider.movieDetails.movieDetails1?.movieID??"");
                            },
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
                        ),

                        ///details
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
                            provider.movieDetails.movieDetails1?.movieDescription??"",
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
                            'Director : ${provider.movieDetails.movieDetails1?.movieDirector}',
                            style: TextStyle(
                              fontSize: widthScale * 4,
                              color: kWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        ///share
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: heightScale * 5
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      Share.share(
                                        "${provider.movieDetails.movieDetails1?.movieName} "
                                            "\nCatch Upcoming Movies... \nWatch Trailer : "
                                            "\n${provider.movieDetails.movieDetails1?.movieTrailerLink}",
                                      );
                                    },
                                    child: Icon(Icons.share,color: kWhite,size: widthScale * 8,)),
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
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     left: widthScale * 4,
                        //     top: heightScale * 4,
                        //     bottom: heightScale * 3,
                        //   ),
                        //   child: Text(
                        //     'Rate & Review',
                        //     style: TextStyle(
                        //       fontSize: widthScale * 5,
                        //       color: kWhite,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        // ),
                        // Center(
                        //   child: RatingBar.builder(
                        //     unratedColor: kGrey.withOpacity(0.2),
                        //     initialRating: 1,
                        //     minRating: 1,
                        //     direction: Axis.horizontal,
                        //     allowHalfRating: true,
                        //     itemCount: 5,
                        //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //     itemBuilder: (context, _) => const Icon(
                        //       Icons.star,
                        //       color: kAmber,
                        //     ),
                        //     onRatingUpdate: (rating) {
                        //       print(rating);
                        //     },
                        //   ),
                        // ),
                        //
                        // //this is my area(Tharaka)
                        // SizedBox(
                        //   height: height,
                        //   child:  ListView.separated(
                        //       separatorBuilder: (BuildContext context, int index) {
                        //         return SizedBox(
                        //           height: widthScale * 5,
                        //         );
                        //       },
                        //       itemCount: 10,
                        //       shrinkWrap: true,
                        //       physics: const NeverScrollableScrollPhysics(),
                        //       itemBuilder: (BuildContext context, int index){
                        //         return Padding(
                        //           padding:  EdgeInsets.only(
                        //             left: widthScale*5,
                        //             right: widthScale*5,
                        //           ),
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(color: kWhite.withOpacity(0.5)),
                        //                 borderRadius: BorderRadius.circular(widthScale*5)
                        //             ),
                        //             child: Row(
                        //               crossAxisAlignment: CrossAxisAlignment.start,
                        //               children: [
                        //                 Padding(
                        //                   padding:  EdgeInsets.only(
                        //                     left: widthScale*2,
                        //                     right: widthScale*3,
                        //                     top: heightScale*1,
                        //                     bottom: heightScale*3,
                        //                   ),
                        //                   child: const CircleAvatar(
                        //                     backgroundImage: AssetImage("images/cover3.jpg"),
                        //                     radius: 25,
                        //                   ),
                        //                 ),
                        //                 SizedBox(
                        //                   width: widthScale*65,
                        //                   child: Column(
                        //                     crossAxisAlignment: CrossAxisAlignment.start,
                        //                     children: [
                        //                       Padding(
                        //                         padding:  EdgeInsets.only(
                        //                           top: heightScale*1,
                        //                           bottom: heightScale*1.5,
                        //                         ),
                        //                         child: const Text(
                        //                           "Tharaka",
                        //                           style: TextStyle(
                        //                             color: kWhite,
                        //                             fontWeight: FontWeight.w900,
                        //                           ),
                        //                         ),
                        //                       ),
                        //                       const Text(
                        //                         "Hello world Hello world Hello world Hello world Hello world Hello world Hello world",
                        //                         style: TextStyle(
                        //                             color: kWhite
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         );
                        //       }
                        //   ),
                        // ),
                        // const Text(
                        //   "Add a review",
                        //   style: TextStyle(
                        //     color: kWhite,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: heightScale * 10,
                        // ),
                      ],
                    ),
                  );
                }
                else{
                  return Stack(
                    children: [
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: YoutubePlayer.convertUrlToId(
                              provider.movieDetails.movieDetails1?.movieTrailerLink ?? "")
                              .toString(),
                          flags: const YoutubePlayerFlags(
                            hideControls: false,
                            controlsVisibleAtStart: true,
                            autoPlay: false,
                            mute: false,
                            enableCaption: true,
                            forceHD: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.purple,
                      ),
                      GestureDetector(
                          onTap: () {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.portraitDown,
                            ]);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: widthScale * 5,
                              top: heightScale * 8,
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: kWhite.withOpacity(0.3),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(widthScale * 2),
                                    topRight: Radius.circular(widthScale * 2),
                                    bottomLeft: Radius.circular(widthScale * 2),
                                    bottomRight: Radius.circular(widthScale * 2),
                                  ),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(widthScale * 1),
                                  child: Icon(Icons.arrow_back_ios_rounded,color: kWhite,),
                                )),
                          )),
                    ],
                  );
                }
            }
          );
        }
      ),
    );
  }
}

