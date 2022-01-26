import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_event.dart';
import 'package:movie_app/bloc/details_bloc/movie_details_state.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailsState> {
  final _repository = MovieRepository();

  MovieDetailBloc() : super(MovieDetailsInitialState()) {
    on<MovieDetailFetch>(_fetchMovieDetails);
  }

  void _fetchMovieDetails(
      MovieDetailFetch event, Emitter<MovieDetailsState> emit) {
    if (event.id != null) {
      Movie? movie = _repository.getMovie(event.id!);
      if (movie == null) {
        return emit(MovieDetailsFailedState());
      } else {
        return emit(MovieDetailsSuccessState(movie));
      }
    }
  }
}
