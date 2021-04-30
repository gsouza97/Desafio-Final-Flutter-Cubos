import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/classes/movie_model.dart';

class API {
  final _authority = 'api.themoviedb.org';
  final _path = '/3/movie/upcoming';
  final _API_KEY = 'a5bc05fb630c9b7fdc560033345fa13e';
  Map<String, String> queryParameters;
  

  Future<Movies> getUpComingMovies() async {
    final response = await http.get(
        Uri.https(_authority, _path, queryParameters = {'api_key': _API_KEY}));
    if (response.statusCode == 200) {
      final movies = Movies.fromJson(jsonDecode(response.body));
      return movies;
    } else {
      return Future.error('Nao encontrado');
    }
  }
}
