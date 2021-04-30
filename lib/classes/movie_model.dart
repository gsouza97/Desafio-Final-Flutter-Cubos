class Movies {
  String title;
  List<Movie> movies;

  Movies.fromJson(Map<String, dynamic> json) {
    title = 'Last Releases';

    var movieList = json['results'] as List;

    movieList.map((e) => Movie.fromJson(e)).toList();

    print(movies);
  }
}

class Movie {
  String title;
  String posterUrl;
  String releaseDate;
  String description;
  double voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['original_title'];
    posterUrl = json['poster_path'];
    releaseDate = json['release_date'];
    description = json['overview'];
    voteAverage = json['vote_average'].toDouble();

    print(title);
    print(posterUrl);
    print(releaseDate);
    print(description);
    print(voteAverage);
  }
}
