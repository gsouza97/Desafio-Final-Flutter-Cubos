import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/movies/theater/theater_model.dart';

class TheaterController {
  final model = TheaterModel();

  List<Movie> theaterList = [];

  StreamController<List<Movie>> theaterStream = StreamController();

  getTheaterMovies() {
    model.getTheaterMovies();
    model.movies.then((value) {
      theaterList.addAll(value.movies);
      theaterStream.add(theaterList);
      print(theaterList.length);
    });
  }

  loadMore() {
    model.page++;
    print(model.page);
    getTheaterMovies();
  }

  saveFav(Movie movie) {
    model.saveFav(movie);
  }

  deleteFav(Movie movie) {
    model.deleteFav(movie);
  }
}
