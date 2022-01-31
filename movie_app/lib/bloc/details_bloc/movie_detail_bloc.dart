import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_event.dart';
import 'package:movie_app/bloc/details_bloc/movie_details_state.dart';
import 'package:movie_app/instanse.dart';
import 'package:movie_app/model/movie.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailsState> {
  final _repository = AppModule.movieRepository;

  MovieDetailBloc() : super(MovieDetailsInitialState()) {
    on<MovieDetailFetchEvent>(_fetchMovieDetails);
    on<MovieDetailResetEvent>(_resetDetails);
  }

  Future<void> _resetDetails(
      MovieDetailResetEvent event, Emitter<MovieDetailsState> emit) async {
    return emit(MovieDetailsInitialState());
  }

  Future<void> _fetchMovieDetails(
      MovieDetailFetchEvent event, Emitter<MovieDetailsState> emit) async {
    if (event.id != null) {
      Movie? movie = await _repository.getMovie(event.id!);
      if (movie == null) {
        return emit(MovieDetailsFailedState());
      } else {
        return emit(MovieDetailsSuccessState(movie));
      }
    }
  }
}
