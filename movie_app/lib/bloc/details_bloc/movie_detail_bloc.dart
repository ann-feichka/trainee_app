import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_event.dart';
import 'package:movie_app/bloc/details_bloc/movie_details_state.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailsState> {
  final _repository = AppInstance.movieRepository;

  MovieDetailBloc() : super(MovieDetailsInitialState()) {
    on<MovieDetailFetchEvent>(_fetchMovieDetails);
    on<MovieDetailResetEvent>(_resetDetails);
  }

  Future<void> _resetDetails(
      MovieDetailResetEvent event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsInitialState());
  }

  Future<void> _fetchMovieDetails(
      MovieDetailFetchEvent event, Emitter<MovieDetailsState> emit) async {
    if (event.id != null) {
      try {
        emit(MovieDetailsLoadingState());
        MovieResponse? movie = await _repository.getMovie(event.id!);
        emit(MovieDetailsSuccessState(movie));
        if (movie.error != null) {
          emit(MovieDetailsFailedState(movie.error));
        }
      } on NetworkError {
        emit(MovieDetailsFailedState(
            'Failed to fetch data. is your device online?'));
      }
    }
  }
}
