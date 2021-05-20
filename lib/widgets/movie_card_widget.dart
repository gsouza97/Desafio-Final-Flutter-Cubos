import 'package:flutter/material.dart';
import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/movie_page.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MoviePage(
                title: movie.title,
                date: movie.releaseDate,
                description: movie.description,
                posterUrl: movie.posterUrl,
              ),
            ),
          );
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: movie.posterUrl,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          movie.posterUrl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                child: Text(
                  movie.title,
                  style: AppTextStyles.bodyWhite15,
                ),
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    'Avaliação: ${movie.voteAverage}',
                    style: AppTextStyles.body,
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Icons.star_rate_sharp,
                    color: Colors.yellow[600],
                    size: 14,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
