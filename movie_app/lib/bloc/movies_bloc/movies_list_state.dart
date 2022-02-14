import 'package:movie_app/model/popular_movie_model.dart';

abstract class MoviesState {}

class MovieInitialState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesSuccessState extends MoviesState {
  final PopularMovieModel resultList;

  MoviesSuccessState(this.resultList);
}

class MoviesFailedState extends MoviesState {
  final String? message;
  final PopularMovieModel resultList;

  MoviesFailedState(this.message, this.resultList);
}
