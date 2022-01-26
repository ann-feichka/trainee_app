import 'package:movie_app/model/movie.dart';

abstract class MoviesListState {}

class MovieInitialState extends MoviesListState {
  List<Movie>? initialList = [];
}

class MoviesLoadingState extends MoviesListState {}

class MoviesSuccessState extends MoviesListState {
  final List<Movie>? resultList;

  MoviesSuccessState(this.resultList);
}

class MoviesListFailedState extends MoviesListState {}
