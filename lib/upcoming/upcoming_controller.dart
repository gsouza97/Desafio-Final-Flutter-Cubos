import 'dart:async';

import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/upcoming/upcoming_model.dart';

class UpComingController {
  final model = UpComingModel();

  StreamController movieStream = StreamController();

  getUpComingMovies() {
    model.getUpComingMovies();
    model.movies.then((value) => movieStream.add(value));
  }
}
