import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/movie_list_widget.dart';

class MovieListBlocBuilder extends StatefulWidget {
  final IdCallback idCallback;
  final bool isHighlited;
  const MovieListBlocBuilder(
      {Key? key, required this.idCallback, required this.isHighlited})
      : super(key: key);

  @override
  State<MovieListBlocBuilder> createState() => _MovieListBlocBuilderState();
}

class _MovieListBlocBuilderState extends State<MovieListBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MoviesListBloc, MoviesState>(
      listener: (context, state) {
        if (state is MoviesFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message!),
          ));
        }
      },
      child:
          BlocBuilder<MoviesListBloc, MoviesState>(builder: (context, state) {
        if (state is MoviesSuccessState) {
          return _showMoviesList(state.resultList, context);
        }
        if (state is MoviesLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MoviesFailedState) {
          return _showMoviesList(state.resultList, context);
        }
        return Center(child: Text(StringConstants.noMovie));
      }),
    );
  }

  Widget _showMoviesList(
      PopularMovieModel movieResponse, BuildContext context) {
    if (movieResponse.movies == null || movieResponse.movies?.isEmpty == true) {
      return Center(child: Text(StringConstants.noMovie));
    }
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1), () {
          BlocProvider.of<MoviesListBloc>(context)..add(MovieListFetched());
        });
      },
      child: MoviesListWidget(
        isHighlited: widget.isHighlited,
        movies: movieResponse,
        idCallback: widget.idCallback,
      ),
    );
  }
}
