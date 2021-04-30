import 'package:movies_app/classes/movie_model.dart';
import 'package:movies_app/home/home_model.dart';

class HomeController {
  final model = HomeModel();

  Future<Movies> get movies {
    return model.movies;
  }

  getMovies() {
    model.getMovies();
  }
}