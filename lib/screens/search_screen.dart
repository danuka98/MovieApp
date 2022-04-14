import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/model/all_movie_details.dart';
import 'package:movieapp/screens/movie_inner_screen.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:movieapp/utils/base.dart';
import 'package:http/http.dart' as http;


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late double widthScale,heightScale,width,height;
  List<MovieDetails> movieList = [];
  List<MovieDetails> searchMovieList = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchMovieDetails();
  }

  getSearchMovieDetails() async{
    String url = Base.getMovies;

    try{
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      );
      Map<String, dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        Search searchDetails = Search.fromJson(responseBody);
        print("======================Works=============================");
        for (int i = 0; i < searchDetails.movieDetails!.length; i++) {
          setState(() {
            movieList.add(searchDetails.movieDetails![i]);
            searchMovieList = movieList;
            _isLoading = false;
          });
        }
      }else{
        print("something went wrong");
      }
    }catch(e){
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
      backgroundColor: kDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: widthScale * 3,
                right: widthScale * 3,
                bottom: widthScale * 3,
              ),
              child: Container(
                margin: EdgeInsets.only(top: heightScale*5),
                width: width,
                height: heightScale * 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kGrey.withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: kDark.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: widthScale*5,
                          top: widthScale * 1
                      ),
                      child: Container(
                        width: widthScale*65,
                        height: widthScale*25,
                        //color: Colors.white,
                        child: TextField(
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle:  FontStyle.normal,
                              fontSize: widthScale * 5
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle:  FontStyle.normal,
                                fontSize: widthScale * 5
                            ),
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          onChanged: (text){
                            text = text.toLowerCase();
                            setState(() {
                              searchMovieList = movieList.where((que) {
                                var queTitle = que.movieName!.toLowerCase();
                                return queTitle.contains(text);
                              }).toList();
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: widthScale*2),
                      child: Container(
                          width: widthScale*10,
                          height: widthScale*10,
                          child: const Icon(Icons.search,color: kWhite,),
                      ),
                    )
                  ],
                ),
              ),
            ),

            _isLoading? CircularProgressIndicator(color: kWhite) : Container(
              height: height,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: widthScale * 5,
                  );
                },
                itemCount: searchMovieList.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MovieInnerPage(movieID: "${searchMovieList[index].movieID}",))
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: widthScale * 5,
                        right: widthScale * 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(widthScale * 5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: widthScale * 20,
                              height: widthScale * 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(searchMovieList[index].coverImage??""),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(widthScale * 5),
                                  bottomLeft: Radius.circular(widthScale * 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: widthScale * 3,
                                right: widthScale * 3,
                                top: widthScale * 3,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: widthScale * 55,
                                    child: Text(
                                      searchMovieList[index].movieName??"",
                                      style: TextStyle(
                                        fontSize: widthScale * 4,
                                        color: kWhite,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: widthScale * 2,
                                      bottom: widthScale * 2,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${searchMovieList[index].rate}/10',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: widthScale * 3.5,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: widthScale * 1
                                          ),
                                          child: Icon(Icons.star,color: Colors.amber,size: widthScale * 4.2,),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: widthScale * 5,
                                            right: widthScale * 5,
                                          ),
                                          child: Text(
                                            "${searchMovieList[index].movieYear}",
                                            style: TextStyle(
                                              color: kGrey,
                                              fontSize: widthScale * 3.5,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthScale * 55,
                                    child: Text(
                                      'Director : ${searchMovieList[index].movieDirector??""}',
                                      style: TextStyle(
                                        fontSize: widthScale * 3.5,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
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
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: widthScale * 5,
            //     right: widthScale * 5
            //   ),
            //   child: SizedBox(
            //     //width: width,
            //     height: height,
            //     child: GridView.builder(
            //       shrinkWrap: true,
            //       itemCount: 10,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisExtent: widthScale * 70,
            //         crossAxisSpacing: widthScale*3,
            //         mainAxisSpacing: widthScale*3,
            //       ),
            //       itemBuilder: (BuildContext context,int index){
            //         return Container(
            //           width: widthScale * 40,
            //           height: widthScale * 30,
            //           decoration: BoxDecoration(
            //             image: const DecorationImage(
            //               image: AssetImage("images/cover5.jpg"),
            //               fit: BoxFit.cover,
            //             ),
            //             borderRadius: BorderRadius.circular(widthScale * 5),
            //           ),
            //         );
            //       }
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
