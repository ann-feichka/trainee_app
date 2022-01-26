import 'dart:math';

import 'package:movie_app/model/movie.dart';

class MovieRepository {
  Movie getMovie(int id) {
    return movies.firstWhere((element) => element.id == id, orElse: null);
  }

  List<Movie> fetchMoviesList() {
    return movies;
  }

  List<Movie> fetchMovieListWithRandom() {
    List<Movie> resMovies = List.from(movies);
    return _getMoviesWithRandomOrder(resMovies);
  }

  List<Movie> _getMoviesWithRandomOrder(List<Movie> movieList) {
    List<Movie> resMovies = List.from(movieList);
    List<Movie> newMovies = [];
    for (var _ in movieList) {
      print(resMovies);
      Movie randomMovie = resMovies.removeAt(_getRandomInt(resMovies.length));
      newMovies.add(randomMovie);
    }
    return newMovies;
  }

  int _getRandomInt(int range) {
    return Random().nextInt(range);
  }
}
