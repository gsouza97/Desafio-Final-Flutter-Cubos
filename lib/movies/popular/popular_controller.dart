import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/movies/popular/popular_model.dart';

class PopularController {
  final model = PopularModel();

  List<Movie> popularList = [];

  StreamController<List<Movie>> popularStream = StreamController();

  getPopularMovies() {
    model.getPopularMovies();
    model.movies.then((value) {
      popularList.addAll(value.movies);
      popularStream.add(popularList);
      print(popularList.length);
    });
  }

  loadMore() {
    model.page++;
    print(model.page);
    getPopularMovies();
  }

  saveFav(Movie movie) {
    model.saveFav(movie);
  }

  deleteFav(Movie movie) {
    model.deleteFav(movie);
  }
}
