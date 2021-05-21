import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/popular/popular_model.dart';
import 'package:movies_app/top_rated/top_rated_model.dart';
import 'package:movies_app/upcoming/upcoming_model.dart';

void main() {
  group('Movies', () {
    // Prep
    final upcomingModel = UpComingModel();
    final popularModel = PopularModel();
    final topRatedModel = TopRatedModel();

    test('Upcoming should not be null', () {
      // Exec
      upcomingModel.getUpComingMovies();

      // Result
      expect(upcomingModel.movies, completion(isNotNull));
    });

    test('Popular should not be null', () {
      // Exec
      popularModel.getPopularMovies();

      // Result
      expect(popularModel.movies, completion(isNotNull));
    });

    test('Top Rated  should not be null', () {
      // Exec
      topRatedModel.getTopRatedMovies();

      // Result
      expect(topRatedModel.movies, completion(isNotNull));
    });
  });
}
