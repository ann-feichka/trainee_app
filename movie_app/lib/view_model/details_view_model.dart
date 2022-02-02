import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie.dart';

class DetailsViewModel with ChangeNotifier {
  StreamController<Movie?> _movieController =
      StreamController<Movie?>.broadcast();
  final _repository = AppInstance.movieRepository;

  Stream<Movie?> get movie => _movieController.stream;

  Future<void> fetchMovieDetails(int? id) async {
    if (id != null) {
      Movie? movie = await _repository.getMovie(id);
      _movieController.add(movie);
    }
  }

  Sink get sinkDetail => _movieController;
}
