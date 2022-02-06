import 'dart:async';

import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/popular_movie_response.dart';

class MoviesViewModel {
  StreamController<PopularMovieResponse?> _moviesController =
      StreamController<PopularMovieResponse?>.broadcast();
  final _repository = AppInstance.movieRepository;

  Stream<PopularMovieResponse?> get movies => _moviesController.stream;

  Future<PopularMovieResponse?> fetchMovieList() async {
    PopularMovieResponse? movies = await _repository.fetchMoviesList();
    _moviesController.add(movies);
  }

  Future<void>? closeStream() =>
      _moviesController.stream.reduce((previous, element) => null);
}
