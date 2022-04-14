import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/model/favorite_details.dart';
import 'package:movieapp/screens/movie_inner_screen.dart';
import 'package:movieapp/styles/colors.dart';
import 'package:movieapp/utils/base.dart';
import 'package:http/http.dart' as http;


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late double widthScale,heightScale,width,height;
  List<MovieDetails> favoriteDetails = [];
  bool _isLoading = true;

  Future getMovie() async{
    String url = Base.getFavorite;

    print("url>>>>$url");
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      );
      print(response.body);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        Favorite detailsClass = Favorite.fromJson(responseBody);
        print("======================Works=============================");
        for (int i = 0; i < detailsClass.movieDetails!.length; i++) {
          setState(() {
            favoriteDetails.add(detailsClass.movieDetails![i]);
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      print("=================throwing Exception error==================");
      print("Error: $e");
      throw Exception("Error On server");
    }
  }

  Future removeFavorite(String id) async {
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
        setState(() {
          _isLoading = true;
          getMovie();
          final snackBar = const SnackBar(
            content: Text('Remove in Favorite'),
            backgroundColor: kPurple,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    } catch (e) {
      print("=================throwing Exception error==================");
      print("Error: $e");
      throw Exception("Error On server");
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovie();
  }

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDark,
      appBar: AppBar(
        backgroundColor: kDark,
        title: Text(
          'Favorite',
          style: TextStyle(
            fontSize: widthScale * 5
          ),
        ),
      ),
      body: _isLoading ? const Center(child: Text('No Added Favorite',style: TextStyle(color: kWhite),)) : SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: widthScale * 5,
                  right: widthScale * 5,
              ),
              child: SizedBox(
                //width: width,
                height: height,
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    bottom: heightScale * 20
                  ),
                    shrinkWrap: true,
                    itemCount: favoriteDetails.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: widthScale * 70,
                      crossAxisSpacing: widthScale*3,
                      mainAxisSpacing: widthScale*3,
                    ),
                    itemBuilder: (BuildContext context,int index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => MovieInnerPage(movieID: "${favoriteDetails[index].movieID}",))
                          );
                        },
                        onLongPressUp: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Positioned(
                                    bottom: heightScale * 6,
                                    child:  Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction){
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                      direction: DismissDirection.horizontal,
                                      child: Dialog(
                                        insetPadding: EdgeInsets.symmetric(horizontal: widthScale * 4),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(widthScale*8),
                                        ),
                                        backgroundColor: kRed,
                                        child: Padding(
                                          padding:  EdgeInsets.only(),
                                          child: Container(
                                            width: widthScale * 85,
                                            height: height / 4.2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: heightScale * 3,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: widthScale * 5,
                                                      right: widthScale * 5
                                                  ),
                                                  child: Text(
                                                      "Are you sure You want to remove this movie ?",
                                                      style: TextStyle(
                                                          color:  kWhite,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: "Poppins",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: widthScale * 5
                                                      ),
                                                      textAlign: TextAlign.center
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: widthScale * 10,
                                                    right: widthScale * 10,
                                                    top: heightScale * 5,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                      removeFavorite(favoriteDetails[index].movieID??"");
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: kWhite),
                                                        borderRadius: BorderRadius.circular(widthScale*4),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                          top: heightScale * 1,
                                                          bottom: heightScale * 1,
                                                          left: widthScale * 10,
                                                          right: widthScale * 10,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Text(
                                                                "Yes, Delete",
                                                                style: TextStyle(
                                                                  color:  kWhite,
                                                                  fontWeight: FontWeight.w300,
                                                                  fontFamily: "Poppins",
                                                                  fontStyle:  FontStyle.normal,
                                                                  fontSize: widthScale * 5,
                                                                )
                                                            ),
                                                            Icon(Icons.delete_outline_sharp,size: widthScale * 5,color: kWhite,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: widthScale * 40,
                          height: widthScale * 30,
                          decoration: BoxDecoration(
                            image:  DecorationImage(
                              image: NetworkImage(favoriteDetails[index].coverImage??""),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(widthScale * 5),
                          ),
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
