import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/upcoming/upcoming_model.dart';

class UpComingController {
  final model = UpComingModel();

  List<Movie> finalList = [];

  StreamController<List<Movie>> movieStream = StreamController();

  getUpComingMovies() {
    model.getUpComingMovies();
    model.movies.then((value) {
      finalList.addAll(value.movies);
      movieStream.add(finalList);
      print(finalList.length);
    });
  }

  loadMore() {
    model.page++;
    print(model.page);
    getUpComingMovies();
  }

  saveFav(Movie movie) {
    model.saveFav(movie);
  }

  deleteFav(Movie movie) {
    model.deleteFav(movie);
  }
}
