class Movies {
  List<Movie> movies;

  Movies({this.movies});

  Movies.fromJson(Map<String, dynamic> json) {
    var movieList = json['results'] as List;

    movies = movieList.map((e) => Movie.fromJson(e)).toList();
  }
}

class Movie {
  String title;
  String posterUrl;
  String releaseDate;
  String description;
  double voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    posterUrl = 'https://image.tmdb.org/t/p/w500/${json['poster_path']}';
    releaseDate = json['release_date'];
    description = json['overview'];
    voteAverage = json['vote_average'].toDouble();
  }
}
