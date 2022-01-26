import 'dart:math';

import 'package:movie_app/model/movie.dart';

class MovieRepository {
  Movie? getMovie(int id) {
    try {
      return movies.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Movie>? fetchMoviesList() {
    return movies;
  }

  List<Movie>? fetchMovieListWithRandom() {
    if (movies == null) {
      return null;
    } else {
      List<Movie>? resMovies = List.from(movies);
      return _shuffleMovieList(resMovies);
    }
  }

  List<Movie> _shuffleMovieList(List<Movie> movieList) {
    List<Movie> resMovies = List.from(movieList);
    List<Movie> newMovies = [];
    for (var _ in movieList) {
      Movie randomMovie = resMovies.removeAt(_getRandomInt(resMovies.length));
      newMovies.add(randomMovie);
    }
    return newMovies;
  }

  int _getRandomInt(int range) {
    return Random().nextInt(range);
  }
}
