import 'package:flutter/foundation.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MoviesViewModel with ChangeNotifier {
  List<Movie>? _movies;
  final _repository = MovieRepository();

  List<Movie>? get movies {
    return _movies;
  }

  void fetchMovieList() async {
    _movies = _repository.fetchMoviesList();
    notifyListeners();
  }

  void fetchMovieListRandomly() async {
    _movies = _repository.fetchMovieListWithRandom();
    notifyListeners();
  }
}
