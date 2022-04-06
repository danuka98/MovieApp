import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/screens/movie_inner_screen.dart';
import 'package:movieapp/styles/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///slideshow
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: <Widget>[
                    for (var i = 0; i < imageList.length; i++)
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageList[i]),
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
                  children: imageList.asMap().entries.map((entry) {
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
                itemCount: 6,
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
                         image: const DecorationImage(
                           image: AssetImage("images/cover3.jpg"),
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
                          image: AssetImage("images/cover4.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(widthScale * 5),
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
                          image: AssetImage("images/cover3.jpg"),
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
                          image: AssetImage("images/cover2.jpg"),
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
