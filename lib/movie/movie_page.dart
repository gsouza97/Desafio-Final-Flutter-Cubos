import 'package:flutter/material.dart';
import 'package:movies_app/movie/widgets/movie_widget.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text('Captain Marvel', style: AppTextStyles.heading15),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MovieWidget(),
      ),
    );
  }
}
