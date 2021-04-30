import 'package:flutter/material.dart';
import 'package:movies_app/classes/movie_model.dart';
import 'package:movies_app/home/widgets/movie_card_widget.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class CategoryWidget extends StatelessWidget {
  final List<Movie> movies;

  const CategoryWidget({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Upcoming',
              style: AppTextStyles.heading30,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 300,
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
