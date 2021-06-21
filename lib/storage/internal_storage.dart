import 'package:movies_app/classes/movie_class.dart';

abstract class InternalStorageAdapter {
  void saveFav(Movie movie);
  //getFav();
  void deleteFav(Movie movie);
}