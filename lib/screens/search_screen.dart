import 'package:flutter/material.dart';
import 'package:movieapp/styles/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late double widthScale,heightScale,width,height;


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
                              // faqDisplay = faq.where((que) {
                              //   var queTitle = que.title!.toLowerCase();
                              //   return queTitle.contains(text);
                              // }).toList();
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

            Container(
              height: height,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: widthScale * 5,
                  );
                },
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
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
                              image: const DecorationImage(
                                image: AssetImage("images/cover3.jpg"),
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
                                    'TitleTitleTitleTitleTitleTitleTitleTitleTitle',
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
                                        '8/10',
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
                                          '2020',
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
                                    'Type',
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
