import 'package:flutter/material.dart';
import 'package:movies_app/widgets/app_bar_widget.dart';

import 'movies/popular/popular_view.dart';
import 'movies/theater/theater_view.dart';
import 'movies/top_rated/top_rated_view.dart';
import 'movies/upcoming/upcoming_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Column(
              children: [
                Container(
                  height: size.height * 0.29,
                  child: TheaterView(),
                ),
                Container(
                  height: size.height * 0.29,
                  child: UpComingView(),
                ),
                Container(
                  height: size.height * 0.29,
                  child: TopRatedView(),
                ),
                Container(
                  height: size.height * 0.29,
                  child: PopularView(),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
