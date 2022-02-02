import 'dart:async';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie.dart';

class MoviesViewModel with ChangeNotifier {
  StreamController<List<Movie>?> _moviesController =
      StreamController<List<Movie>?>.broadcast();
  final _repository = AppInstance.movieRepository;

  Stream<List<Movie>?> get movies => _moviesController.stream;

  Future<List<Movie>?> fetchMovieList() async {
    List<Movie>? movies = await _repository.fetchMoviesList();
    _moviesController.add(movies);
  }

  Future<void> fetchMovieListRandomly() async {
    List<Movie>? movies = await _repository.fetchMovieListWithRandom();
    _moviesController.add(movies);
  }

  Future<void>? closeStream() =>
      _moviesController.stream.reduce((previous, element) => null);
}
