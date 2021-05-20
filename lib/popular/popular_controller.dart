import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/popular/popular_model.dart';

class PopularController {
  final model = PopularModel();

  Future<Movies> get movies {
    return model.movies;
  }

  getPopularMovies() {
    model.getPopularMovies();
  }
}
