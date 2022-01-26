import 'package:movie_app/model/movie.dart';

abstract class MovieDetailState{}

class MovieDetailInitialState extends MovieDetailState{
  Movie? movie;
}

class MovieDetailSuccessState extends MovieDetailState{
  final Movie? movie;

  MovieDetailSuccessState(this.movie);
}