import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/top_rated/top_rated_model.dart';

class TopRatedController {
  final model = TopRatedModel();

  StreamController movieStream = StreamController();

  getTopRatedMovies() {
    model.getTopRatedMovies();
    model.movies.then((value) => movieStream.add(value));
  }
}
