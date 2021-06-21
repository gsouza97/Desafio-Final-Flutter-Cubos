import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/popular/popular_model.dart';

class PopularController {
  final model = PopularModel();

  StreamController movieStream = StreamController();

  getPopularMovies() {
    model.getPopularMovies();
    model.movies.then((value) => movieStream.add(value));
  }
}
