import 'package:flutter/material.dart';
import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/movie_page.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({@required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 2, 5, 5),
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
                width: size.width * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FadeInImage(
                  placeholder: AssetImage(
                    'assets/pngtree-new-film-premiere-theater-poster-image_195512.jpg',
                  ),
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                    movie.posterUrl == 'https://image.tmdb.org/t/p/w500/null'
                        ? 'https://www.2queue.com/2queue/wp-content/uploads/sites/6/tdomf/4299/movie-poster-coming-soon.png'
                        : movie.posterUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
