


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_event.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_state.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent,MovieDetailState> {

  // final _movieList  ;
  final _repository = MovieRepository();
  // final int id ;

  MovieDetailBloc() : super(MovieDetailInitialState()){
    on<MovieDetailFetch>(_fetchMovieDetails);
  }

  void _fetchMovieDetails(MovieDetailEvent event, Emitter<MovieDetailState> emit) {
    if(event.props!=null){
      return emit(MovieDetailSuccessState(_repository.getMovie(event.props as int)));}
    // final List<Movie> resultList = _repository.fetchMoviesList();
  }


}