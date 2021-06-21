import 'package:flutter/material.dart';
import 'package:movies_app/upcoming/upcoming_view.dart';
import 'package:movies_app/popular/popular_view.dart';
import 'package:movies_app/top_rated/top_rated_view.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final tabs = [
    UpComingView(),
    PopularView(),
    TopRatedView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text('Movies', style: AppTextStyles.title),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Color(0xff111828),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Lançamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_sharp),
            label: 'Populares',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Mais Votados',
          ),
        ],
      ),
    );
  }
}
