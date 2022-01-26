import 'package:movie_app/model/movie.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {
  Movie? movie;
}

class MovieDetailsSuccessState extends MovieDetailsState {
  final Movie movie;

  MovieDetailsSuccessState(this.movie);
}
