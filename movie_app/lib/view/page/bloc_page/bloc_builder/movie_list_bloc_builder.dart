import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/view/widget/movies_list_widget.dart';

class MovieListBlocBuilder extends StatelessWidget {
  final bool isLandscape;
  final ItemInterceptor itemInterceptor;
  const MovieListBlocBuilder(
      {Key? key, required this.isLandscape, required this.itemInterceptor})
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
          child: MoviesListWidget(
            movies: state.resultList!,
            isLandscape: isLandscape,
            itemInterceptor: itemInterceptor,
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
