import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';

class AppBloc {
  MoviesListBloc _moviesListBloc;
  MovieDetailBloc _movieDetailBloc;

  AppBloc()
      : _moviesListBloc = MoviesListBloc(),
        _movieDetailBloc = MovieDetailBloc();

  MoviesListBloc get moviesListBloc => _moviesListBloc;
  MovieDetailBloc get movieDetailBloc => _movieDetailBloc;
}
