
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_state.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';

// EventTransformer<E> throttleDroppable<E>(Duration duration) {
//   return (events, mapper) {
//     return droppable<E>().call(events.throttle(duration), mapper);
//   };
// }

class MovieListBloc extends Bloc<MovieListEvent,MovieListState> {

  // final _movieList  ;
  final _repository = MovieRepository();

  MovieListBloc() : super(MovieListInitialState()){
    on<MovieListFetched>(_fetchMoviesList);
  }

  void _fetchMoviesList(MovieListFetched event, Emitter<MovieListState> emit) {
    // final List<Movie> resultList = _repository.fetchMoviesList();
    return emit(MovieListSuccessState(_repository.fetchMoviesList()));
  }


}