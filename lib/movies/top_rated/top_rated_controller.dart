import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/movies/top_rated/top_rated_model.dart';

class TopRatedController {
  final model = TopRatedModel();

  List<Movie> topRatedList = [];

  StreamController<List<Movie>> topRatedStream = StreamController();

  getTopRatedMovies() {
    model.getTopRatedMovies();
    model.movies.then((value) {
      topRatedList.addAll(value.movies);
      topRatedStream.add(topRatedList);
      print(topRatedList.length);
    });
  }

  loadMore() {
    model.page++;
    print(model.page);
    getTopRatedMovies();
  }

  saveFav(Movie movie) {
    model.saveFav(movie);
  }

  deleteFav(Movie movie) {
    model.deleteFav(movie);
  }
}
