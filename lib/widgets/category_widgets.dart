import 'package:flutter/material.dart';
import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class CategoryWidget extends StatelessWidget {
  final List<Movie> movies;
  final String category;

  const CategoryWidget({@required this.movies, @required this.category});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              category,
              style: AppTextStyles.heading30,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: size.height * 0.67,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies
                  .map(
                    (e) => MovieCardWidget(
                      title: e.title,
                      posterUrl: e.posterUrl,
                      value: e.voteAverage,
                      description: e.description,
                      date: e.releaseDate,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
