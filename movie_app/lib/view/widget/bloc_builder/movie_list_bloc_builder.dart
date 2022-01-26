import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/view/widget/movies_list.dart';

class MovieListBlocBuilder extends StatelessWidget {
  final bool isBloc;
  final bool isLandscape;

  const MovieListBlocBuilder(
      {Key? key, required this.isBloc, required this.isLandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListBloc, MoviesListState>(
        builder: (context, state) {
      if (state is MoviesSuccessState) {
        return RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              context.read<MoviesListBloc>()..add(MovieListRefresh());
            });
          },
          child: MoviesList(
              movies: state.resultList!,
              isBloc: isBloc,
              isLandscape: isLandscape),
        );
      }
      if (state is MoviesLoadingState) {
        return CircularProgressIndicator.adaptive();
      }
      return Center(child: Text("No Movie"));
    });
  }
}
