import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie_model.dart';

class DetailsViewModel with ChangeNotifier {
  StreamController<MovieModel?> _movieController =
      StreamController<MovieModel?>.broadcast();
  final _repository = AppInstance.movieRepository;

  Stream<MovieModel?> get movie => _movieController.stream;

  Future<void> fetchMovieDetails(int? id) async {
    if (id != null) {
      MovieModel? movie = await _repository.getMovie(id);
      _movieController.add(movie);
    }
  }

  Sink get sinkDetail => _movieController;

  Future<void> closeStream() => _movieController.close();
}
