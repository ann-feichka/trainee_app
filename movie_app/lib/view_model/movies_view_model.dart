import 'dart:async';

import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/popular_movie_model.dart';

class MoviesViewModel {
  StreamController<String?> _errorController =
      StreamController<String?>.broadcast();

  StreamController<PopularMovieModel?> _moviesController =
      StreamController<PopularMovieModel?>.broadcast();
  final _repository = AppInstance.movieRepository;

  Stream<PopularMovieModel?> get popularMovieResponse =>
      _moviesController.stream;
  Stream<String?> get errors => _errorController.stream;

  Future<void> fetchMovieList() async {
    PopularMovieModel moviesResponse = await _repository.fetchMoviesList();
    if (moviesResponse.error != null) {
      _errorController.add(moviesResponse.error);
      PopularMovieModel cachedMovies =
          await _repository.fetchCashedMoviesList();
      _moviesController.add(cachedMovies);
    } else {
      _moviesController.add(moviesResponse);
    }
  }
}
