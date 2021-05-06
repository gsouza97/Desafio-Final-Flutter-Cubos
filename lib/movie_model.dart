import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/utils/api.dart';

class MovieModel {
  Future<Movies> _movies;

  Future<Movies> get movies {
    return _movies;
  }

  getUpComingMovies() {
    _movies = API().getMovies('upcoming');
  }

  getTopRatedMovies() {
    _movies = API().getMovies('top_rated');
  }

  getPopularMovies() {
    _movies = API().getMovies('popular');
  }
}
