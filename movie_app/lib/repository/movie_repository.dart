import 'dart:math';

import 'package:movie_app/model/movie.dart';

class MovieRepository {
  Future<Movie?> getMovie(int id) async {
    try {
      return movies.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<Movie>?> fetchMoviesList() async {
    return Future.value(movies);
  }

  Future<List<Movie>?> fetchMovieListWithRandom() async {
    if (movies == null) {
      return null;
    } else {
      List<Movie>? resMovies = List.from(movies);
      return await _shuffleMovieList(resMovies);
    }
  }

  Future<List<Movie>> _shuffleMovieList(List<Movie> movieList) async {
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
