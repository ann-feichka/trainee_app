import 'package:movie_app/model/movie_model.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieModel movie;

  MovieDetailsSuccessState(this.movie);
}

class MovieDetailsFailedState extends MovieDetailsState {
  final String? message;

  MovieDetailsFailedState(this.message);
}

class MovieDetailsLoadingState extends MovieDetailsState {}
