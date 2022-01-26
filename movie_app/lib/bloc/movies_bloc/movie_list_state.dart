import 'package:movie_app/model/movie.dart';

abstract class MovieListState {}

 class MovieListInitialState extends MovieListState{
    List<Movie> initialList = [];
 }

 class MovieListLoadingState extends MovieListState{

 }

 class MovieListSuccessState extends MovieListState{
    final List<Movie>? resultList;
  MovieListSuccessState(this.resultList);
 }

 class MovieListFailedState extends MovieListState{

 }