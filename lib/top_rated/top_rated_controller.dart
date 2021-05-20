import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/top_rated/top_rated_model.dart';

class TopRatedController {
  final model = TopRatedModel();

  Future<Movies> get movies {
    return model.movies;
  }

  getTopRatedMovies() {
    model.getTopRatedMovies();
  }
}
