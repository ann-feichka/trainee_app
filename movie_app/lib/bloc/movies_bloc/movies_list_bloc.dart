import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/bloc/movies_bloc/movies_list_state.dart';
import 'package:movie_app/model/popular_movie_response.dart';

class MoviesListBloc extends Bloc<MovieListEvent, MoviesState> {
  final _repository = AppInstance.movieRepository;

  MoviesListBloc() : super(MovieInitialState()) {
    on<MovieListFetched>(_fetchMovies);
  }

  Future<void> _fetchMovies(
      MovieListFetched event, Emitter<MoviesState> emit) async {
    emit(MoviesLoadingState());
    final PopularMovieResponse? resultList =
        await _repository.fetchMoviesList();
    if (resultList == null) {
      emit(MoviesFailedState());
    } else {
      emit(MoviesSuccessState(resultList));
    }
  }
}
