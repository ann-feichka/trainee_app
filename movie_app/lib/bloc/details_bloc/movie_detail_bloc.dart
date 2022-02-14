import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_event.dart';
import 'package:movie_app/bloc/details_bloc/movie_details_state.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailsState> {
  final _repository = AppInstance.movieRepository;

  MovieDetailBloc() : super(MovieDetailsInitialState()) {
    on<MovieDetailFetchEvent>(_fetchMovieDetails);
  }

  Future<void> _fetchMovieDetails(
      MovieDetailFetchEvent event, Emitter<MovieDetailsState> emit) async {
    if (event.id != null) {
      emit(MovieDetailsLoadingState());
      MovieModel? movie = await _repository.getMovie(event.id!);
      if (movie?.error != null || movie == null) {
        emit(MovieDetailsFailedState(movie?.error ?? "Network error"));
      }
      emit(MovieDetailsSuccessState(movie!));
    } else {
      emit(MovieDetailsInitialState());
    }
  }
}
