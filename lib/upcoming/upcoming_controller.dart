import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/upcoming/upcoming_model.dart';

class UpComingController {
  final model = UpComingModel();

  Future<Movies> get movies {
    return model.movies;
  }

  getUpComingMovies() {
    model.getUpComingMovies();
  }
}
