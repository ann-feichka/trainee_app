import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/bloc/movies_bloc/movies_list_state.dart';
import 'package:movie_app/model/popular_movie_model.dart';

class MoviesListBloc extends Bloc<MovieListEvent, MoviesState> {
  final _repository = AppInstance.movieRepository;

  MoviesListBloc() : super(MovieInitialState()) {
    on<MovieListFetched>(_fetchMovies);
  }

  Future<void> _fetchMovies(
      MovieListFetched event, Emitter<MoviesState> emit) async {
    emit(MoviesLoadingState());
    PopularMovieModel _resultList = await _repository.fetchMoviesList();
    if (_resultList.error != null) {
      PopularMovieModel cachedMovies =
          await _repository.fetchCashedMoviesList();
      emit(MoviesFailedState(_resultList.error, cachedMovies));
    }
    if (_resultList.movies != null) {
      emit(MoviesSuccessState(_resultList));
    }
  }
}
