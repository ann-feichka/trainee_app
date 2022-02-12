import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/bloc/movies_bloc/movies_list_state.dart';
import 'package:movie_app/model/popular_movie_response.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MoviesListBloc extends Bloc<MovieListEvent, MoviesState> {
  final _repository = AppInstance.movieRepository;
  PopularMovieResponse _resultList = PopularMovieResponse();

  MoviesListBloc() : super(MovieInitialState()) {
    on<MovieListFetched>(_fetchMovies);
  }

  Future<void> _fetchMovies(
      MovieListFetched event, Emitter<MoviesState> emit) async {
    try {
      emit(MoviesLoadingState());
      _resultList = await _repository.fetchMoviesList();
      emit(MoviesSuccessState(_resultList));
      if (_resultList.error != null) {
        emit(MoviesFailedState(_resultList.error, _resultList));
      }
    } on NetworkError {
      emit(MoviesFailedState(
          'Failed to fetch data. is your device online?', _resultList));
    }
  }
}
