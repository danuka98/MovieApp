import 'package:flutter/material.dart';
import 'package:movieapp/styles/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late double widthScale,heightScale,width,height;

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
      body: SingleChildScrollView(
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
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: widthScale * 70,
                      crossAxisSpacing: widthScale*3,
                      mainAxisSpacing: widthScale*3,
                    ),
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        width: widthScale * 40,
                        height: widthScale * 30,
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
