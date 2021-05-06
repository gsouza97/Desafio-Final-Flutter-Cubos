import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/classes/movie_class.dart';

class API {
  final _authority = 'api.themoviedb.org';
  final _API_KEY = 'a5bc05fb630c9b7fdc560033345fa13e';
  int page = 1;
  Map<String, String> queryParameters;

  Future<Movies> getMovies(String path) async {
    final response = await http.get(Uri.https(
        _authority,
        "/3/movie/$path",
        queryParameters = {
          'api_key': _API_KEY,
          "language": "pt-BR",
          "page": '$page'
        }));
    if (response.statusCode == 200) {
      final movies = Movies.fromJson(jsonDecode(response.body));
      return movies;
    } else {
      return Future.error('Não encontrado');
    }
  }
}
