import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/bloc/movies_bloc/movies_list_state.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MoviesListBloc extends Bloc<MovieListEvent, MoviesListState> {
  final _repository = MovieRepository();

  MoviesListBloc() : super(MovieInitialState()) {
    on<MovieListFetched>(_fetchMovies);
    on<MovieListRefresh>(_refreshMovies);
  }

  void _fetchMovies(MovieListFetched event, Emitter<MoviesListState> emit) {
    final List<Movie>? resultList = _repository.fetchMoviesList();
    return emit(MoviesSuccessState(resultList));
  }

  void _refreshMovies(MovieListRefresh event, Emitter<MoviesListState> emit) {
    final List<Movie>? resultList = _repository.fetchMovieListWithRandom();
    return emit(MoviesSuccessState(resultList));
  }
}
