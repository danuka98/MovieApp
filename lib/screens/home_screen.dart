import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/model/getHome.dart';
import 'package:movieapp/screens/movie_inner_screen.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:movieapp/utils/base.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double widthScale,heightScale,width,height;

  List<String> imageList = [
    "images/cover1.jpg",
    "images/cover2.jpg",
    "images/cover3.jpg",
    "images/cover4.jpg",
    "images/cover5.jpg",
  ];

  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<Map> actionList = [];
  List<Map> comedyList = [];
  List<Map> dramaList = [];
  List<Map> slideShow = [];
  bool isLoading = true;


  getHomeDetails() async{
    String url = Base.getHome;

    try{
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      );
      Map<String, dynamic> responseBody = json.decode(response.body);

      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 200) {
        GetHome homeData = GetHome.fromJson(responseBody);
        print("======================Works=============================");

        homeData.movieCategories?.action?.forEach((element) {
          actionList.add({
           "movieID" : element.movieID,
            "image" : element.coverImage
          });
        });

        homeData.movieCategories?.comedy?.forEach((element) {
          comedyList.add({
            "movieID" : element.movieID,
            "image" : element.coverImage
          });
        });

        homeData.movieCategories?.drama?.forEach((element) {
          dramaList.add({
            "movieID" : element.movieID,
            "image" : element.coverImage
          });
        });

        homeData.movieCategories?.slideShow?.forEach((element) {
          slideShow.add({
            "movieID" : element.slideShowMovie?.movieID,
            "image" : element.slideShowMovie?.image
          });
        });
      }else{
        print("something went wrong");
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeDetails();
  }


  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDark,
      body: isLoading? Center(child: CircularProgressIndicator(color: kWhite,)) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///slideshow
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: <Widget>[
                    for (var i = 0; i < slideShow.length; i++)
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(slideShow[i]["image"]??""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      height: height / 1.5,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: width,
                    height: height / 4,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 80,
                          spreadRadius: 10,
                          offset: Offset(0, 80),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: slideShow.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: widthScale * 2,
                        height: widthScale * 2,
                        margin: EdgeInsets.symmetric(vertical: widthScale * 2, horizontal: widthScale * 1),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kWhite.withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),

            ///upcoming list
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 6,
                top: heightScale * 5,
                bottom: heightScale * 2,
              ),
              child: Text(
                'Upcoming',
                style: TextStyle(
                  fontSize: widthScale * 6,
                  color: kWhite,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: heightScale * 30,
              child: ListView.separated(
                padding: EdgeInsets.only(
                    left: widthScale * 6,
                  right: widthScale * 6
                ),
                shrinkWrap: true,
                itemCount: slideShow.length,
                scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: widthScale * 6,
                    );
                  },
                itemBuilder: (BuildContext context, int index){
                   return GestureDetector(
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (_) => const MovieInnerPage(movieID: "100",))
                       );
                     },
                     child: Container(
                       width: widthScale * 40,
                       height: widthScale * 20,
                       decoration: BoxDecoration(
                         image:  DecorationImage(
                           image: NetworkImage(slideShow[index]["image"]??""),
                           fit: BoxFit.cover,
                         ),
                         borderRadius: BorderRadius.circular(widthScale * 5),
                       ),
                     ),
                   );
                }
              ),
            ),

            ///Action list
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 6,
                top: heightScale * 5,
                bottom: heightScale * 2,
              ),
              child: Text(
                'Action',
                style: TextStyle(
                    fontSize: widthScale * 6,
                    color: kWhite,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: heightScale * 30,
              child: ListView.separated(
                  padding: EdgeInsets.only(
                      left: widthScale * 6,
                      right: widthScale * 6
                  ),
                  shrinkWrap: true,
                  itemCount: actionList.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: widthScale * 6,
                    );
                  },
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => MovieInnerPage(movieID: "${actionList[index]["movieID"]}",))
                        );
                      },
                      child: Container(
                        width: widthScale * 40,
                        height: widthScale * 20,
                        decoration: BoxDecoration(
                          image:  DecorationImage(
                            image: NetworkImage(actionList[index]["image"]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(widthScale * 5),
                        ),
                      ),
                    );
                  }
              ),
            ),

            ///comedy list
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 6,
                top: heightScale * 5,
                bottom: heightScale * 2,
              ),
              child: Text(
                'Comedy',
                style: TextStyle(
                    fontSize: widthScale * 6,
                    color: kWhite,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: heightScale * 30,
              child: ListView.separated(
                  padding: EdgeInsets.only(
                      left: widthScale * 6,
                      right: widthScale * 6
                  ),
                  shrinkWrap: true,
                  itemCount: comedyList.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: widthScale * 6,
                    );
                  },
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: widthScale * 40,
                      height: widthScale * 20,
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(comedyList[index]["image"]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(widthScale * 5),
                      ),
                    );
                  }
              ),
            ),

            ///drama list
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 6,
                top: heightScale * 5,
                bottom: heightScale * 2,
              ),
              child: Text(
                'Drama',
                style: TextStyle(
                    fontSize: widthScale * 6,
                    color: kWhite,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: heightScale * 30,
              child: ListView.separated(
                  padding: EdgeInsets.only(
                      left: widthScale * 6,
                      right: widthScale * 6
                  ),
                  shrinkWrap: true,
                  itemCount: dramaList.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: widthScale * 6,
                    );
                  },
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: widthScale * 40,
                      height: widthScale * 20,
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(dramaList[index]["image"]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(widthScale * 5),
                      ),
                    );
                  }
              ),
            ),

            ///horror list
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 6,
                top: heightScale * 5,
                bottom: heightScale * 2,
              ),
              child: Text(
                'Horror',
                style: TextStyle(
                    fontSize: widthScale * 6,
                    color: kWhite,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: heightScale * 30,
              child: ListView.separated(
                  padding: EdgeInsets.only(
                      left: widthScale * 6,
                      right: widthScale * 6
                  ),
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: widthScale * 6,
                    );
                  },
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: widthScale * 40,
                      height: widthScale * 20,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("images/cover1.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(widthScale * 5),
                      ),
                    );
                  }
              ),
            ),

            ///Romance list
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 6,
                top: heightScale * 5,
                bottom: heightScale * 2,
              ),
              child: Text(
                'Romance',
                style: TextStyle(
                    fontSize: widthScale * 6,
                    color: kWhite,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: heightScale * 15
              ),
              child: SizedBox(
                height: heightScale * 30,
                child: ListView.separated(
                    padding: EdgeInsets.only(
                        left: widthScale * 6,
                        right: widthScale * 6
                    ),
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: widthScale * 6,
                      );
                    },
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        width: widthScale * 40,
                        height: widthScale * 20,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("images/cover5.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(widthScale * 5),
                        ),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
