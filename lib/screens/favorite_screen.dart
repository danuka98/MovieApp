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
      body: _isLoading ? const Center(child: CircularProgressIndicator(color: kWhite,)) : SingleChildScrollView(
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
