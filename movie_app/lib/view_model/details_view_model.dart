import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:movie_app/instanse.dart';
import 'package:movie_app/model/movie.dart';

class DetailsViewModel with ChangeNotifier {
  StreamController<Movie?> _movieController =
      StreamController<Movie?>.broadcast();
  final _repository = AppModule.movieRepository;

  Stream<Movie?> get movie => _movieController.stream;

  Future<void> fetchMovieDetails(int? id) async {
    Movie? movie;
    if (id == null) {
      movie = null;
    } else {
      movie = await _repository.getMovie(id);
    }
    _movieController.add(movie);
  }

  Sink get sinkDetail => _movieController;
}
