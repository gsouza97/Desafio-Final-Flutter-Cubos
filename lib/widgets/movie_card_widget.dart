import 'package:flutter/material.dart';
import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/movie_page.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({@required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MoviePage(
                movie: movie,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      movie.posterUrl == 'https://image.tmdb.org/t/p/w500/null'
                          ? 'https://www.2queue.com/2queue/wp-content/uploads/sites/6/tdomf/4299/movie-poster-coming-soon.png'
                          : movie.posterUrl,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: size.width * 0.7,
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
    );
  }
}
