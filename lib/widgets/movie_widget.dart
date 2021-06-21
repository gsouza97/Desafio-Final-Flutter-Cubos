import 'package:flutter/material.dart';
import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/upcoming/upcoming_controller.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MovieWidget extends StatefulWidget {
  final Movie movie;

  const MovieWidget({
    @required this.movie,
  });

  @override
  _MovieWidgetState createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  final controller = UpComingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.movie.posterUrl,
            child: Container(
              height: size.height * 0.43,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.movie.posterUrl ==
                            'https://image.tmdb.org/t/p/w500/null'
                        ? 'https://www.2queue.com/2queue/wp-content/uploads/sites/6/tdomf/4299/movie-poster-coming-soon.png'
                        : widget.movie.posterUrl,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.title,
                      style: AppTextStyles.heading,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Data de Estreia: ${widget.movie.releaseDate}',
                      style: AppTextStyles.bodyBold,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: widget.movie.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: Colors.redAccent,
                iconSize: 30,
                onPressed: () {
                  setState(
                    () {
                      if (widget.movie.isFavorite) {
                        widget.movie.isFavorite = false;
                        controller.deleteFav(widget.movie);
                      } else {
                        widget.movie.isFavorite = true;
                        controller.saveFav(widget.movie);
                      }
                    },
                  );
                },
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Enredo',
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 5),
          Text(
            widget.movie.description,
            style: AppTextStyles.body,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
