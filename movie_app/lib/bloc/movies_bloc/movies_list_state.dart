import 'package:movie_app/model/popular_movie_response.dart';

abstract class MoviesState {}

class MovieInitialState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesSuccessState extends MoviesState {
  final PopularMovieResponse? resultList;

  MoviesSuccessState(this.resultList);
}

class MoviesFailedState extends MoviesState {}
