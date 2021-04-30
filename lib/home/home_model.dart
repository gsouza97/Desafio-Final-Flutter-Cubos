import 'package:movies_app/classes/movie_model.dart';
import 'package:movies_app/utils/api.dart';

class HomeModel {
  Future<Movies> _movies;

  Future<Movies> get movies {
    return _movies;
  }

  getMovies() {
    _movies = API().getUpComingMovies();
  }
}