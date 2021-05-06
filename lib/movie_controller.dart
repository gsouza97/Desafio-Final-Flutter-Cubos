import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/movie_model.dart';

class MovieController {
  final model = MovieModel();

  Future<Movies> get movies {
    return model.movies;
  }

  getUpComingMovies() {
    model.getUpComingMovies();
  }

  getTopRatedMovies() {
    model.getTopRatedMovies();
  }

  getUpPopularMovies() {
    model.getPopularMovies();
  }
}
