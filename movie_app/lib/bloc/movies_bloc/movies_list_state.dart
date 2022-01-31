import 'package:movie_app/model/movie.dart';

abstract class MoviesListState {
  List<Object?> get props => [];
}

class MovieInitialState extends MoviesListState {}

class MoviesLoadingState extends MoviesListState {}

class MoviesSuccessState extends MoviesListState {
  final List<Movie>? resultList;

  MoviesSuccessState(this.resultList);
}

class MoviesListFailedState extends MoviesListState {}

class MovieSelectedState extends MoviesListState {
  final int? id;

  MovieSelectedState(this.id);
  List<Object?> get props => [id];
}
