import 'package:movie_app/model/movie.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  final Movie movie;

  MovieDetailsSuccessState(this.movie);
}

class MovieDetailsFailedState extends MovieDetailsState {}
