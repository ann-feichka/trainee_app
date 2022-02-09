import 'package:movie_app/model/movie_response.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieResponse movie;

  MovieDetailsSuccessState(this.movie);
}

class MovieDetailsFailedState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}
