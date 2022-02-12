import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie_response.dart';

class DetailsViewModel with ChangeNotifier {
  StreamController<MovieResponse?> _movieController =
      StreamController<MovieResponse?>.broadcast();
  final _repository = AppInstance.movieRepository;

  Stream<MovieResponse?> get movie => _movieController.stream;

  Future<void> fetchMovieDetails(int? id) async {
    if (id != null) {
      MovieResponse? movie = await _repository.getMovie(id);
      _movieController.add(movie);
    }
  }

  Sink get sinkDetail => _movieController;

  Future<void> closeStream() => _movieController.close();
}
