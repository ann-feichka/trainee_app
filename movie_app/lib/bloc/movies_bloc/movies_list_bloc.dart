import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/bloc/movies_bloc/movies_list_state.dart';
import 'package:movie_app/instanse.dart';
import 'package:movie_app/model/movie.dart';

class MoviesListBloc extends Bloc<MovieListEvent, MoviesListState> {
  final _repository = AppModule.movieRepository;

  MoviesListBloc() : super(MovieInitialState()) {
    on<MovieListFetched>(_fetchMovies);
    on<SelectMovieItem>(_selectMovie);
  }

  Future<void> _fetchMovies(
      MovieListFetched event, Emitter<MoviesListState> emit) async {
    final List<Movie>? resultList = event.isShuffled
        ? await _repository.fetchMovieListWithRandom()
        : await _repository.fetchMoviesList();
    if (resultList == null) {
      return emit(MoviesListFailedState());
    } else {
      return emit(MoviesSuccessState(resultList));
    }
  }

  void _selectMovie(SelectMovieItem event, Emitter<MoviesListState> emit) {
    int? selectedId = event.id;
    return emit(MovieSelectedState(selectedId));
  }
}
