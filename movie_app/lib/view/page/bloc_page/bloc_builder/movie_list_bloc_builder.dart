import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/view/widget/movies_list.dart';

class MovieListBlocBuilder extends StatelessWidget {
  final bool isLandscape;
  final Function onTap;

  const MovieListBlocBuilder(
      {Key? key, required this.isLandscape, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListBloc, MoviesListState>(
        builder: (context, state) {
      if (state is MoviesSuccessState) {
        return RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              context.read<MoviesListBloc>()
                ..add(MovieListFetched(isShuffled: true));
            });
          },
          child: MoviesList(
            movies: state.resultList!,
            isLandscape: isLandscape,
            onTap: () {},
          ),
        );
      }
      if (state is MoviesLoadingState) {
        return CircularProgressIndicator.adaptive();
      }
      return Center(child: Text("No Movie"));
    });
  }
}

_fetchDetails(BuildContext context) {
  context.read<MovieDetailBloc>()..add(MovieDetailFetchEvent(3));
}
