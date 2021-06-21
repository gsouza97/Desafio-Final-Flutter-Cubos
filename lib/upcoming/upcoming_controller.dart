import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/upcoming/upcoming_model.dart';

class UpComingController {
  final model = UpComingModel();

  List<Movie> upComingList = [];

  StreamController<List<Movie>> upComingStream = StreamController();

  getUpComingMovies() {
    model.getUpComingMovies();
    model.movies.then((value) {
      upComingList.addAll(value.movies);
      upComingStream.add(upComingList);
      print(upComingList.length);
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
