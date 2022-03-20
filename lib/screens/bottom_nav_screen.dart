import 'package:flutter/material.dart';
import 'package:movieapp/screens/favorite_screen.dart';
import 'package:movieapp/screens/home_screen.dart';
import 'package:movieapp/screens/profile_screen.dart';
import 'package:movieapp/screens/search_screen.dart';
import 'package:movieapp/styles/colors.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _pageIndex = 0;
  late double widthScale,heightScale;


  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 100;
    heightScale = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(widthScale * 5),
          topLeft: Radius.circular(widthScale * 5),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: kDarkGrey,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search_outlined),
              label: 'Search',
              backgroundColor: kDarkGrey,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: 'Favorite',
              backgroundColor: kDarkGrey,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Account',
              backgroundColor: kDarkGrey,
            ),
          ],
          selectedLabelStyle: TextStyle(
                fontSize: widthScale * 4,
                fontWeight: FontWeight.bold,
              ),
          currentIndex: _pageIndex,
          backgroundColor: kDarkLight,
          selectedItemColor: kWhite,
          unselectedItemColor: kGrey.withOpacity(0.6),
          onTap: (value) {
           setState(() {
             _pageIndex = value;
           });
          },
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody(){
    List<Widget> pages = [
      _pageIndex == 0 ? Container(
        alignment: Alignment.center,
        child: const Home(),
      ) : Container(),
      _pageIndex == 1 ? Container(
        alignment: Alignment.center,
        child: const SearchScreen(),
      ) : Container(),
      _pageIndex == 2 ? Container(
        alignment: Alignment.center,
        child: const FavoriteScreen(),
      ) : Container(),
      _pageIndex == 3 ? Container(
        alignment: Alignment.center,
        child: const ProfileScreen(),
      ) : Container(),

    ];
    return IndexedStack(
      index: _pageIndex,
      children: pages,
    );
  }
}
