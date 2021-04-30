import 'package:flutter/material.dart';
import 'package:movies_app/home/home_controller.dart';
import 'package:movies_app/home/widgets/category_widgets.dart';
import 'package:movies_app/utils/api.dart';
import '../utils/app_text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getMovies();
  }

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
      body: FutureBuilder(
        future: controller.movies,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          } else if (snapshot.hasData) {
            return CategoryWidget(movies: snapshot.data.movies);
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
