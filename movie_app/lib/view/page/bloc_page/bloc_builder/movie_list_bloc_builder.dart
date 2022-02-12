import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/movie_list_widget.dart';

class MovieListBlocBuilder extends StatelessWidget {
  final IdCallback idCallback;
  final bool isHighlited;
  const MovieListBlocBuilder(
      {Key? key, required this.idCallback, required this.isHighlited})
      : super(key: key);

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
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(Duration(seconds: 1), () {
                context.read<MoviesListBloc>()..add(MovieListFetched());
              });
            },
            child: MoviesListWidget(
              isHighlited: isHighlited,
              movies: state.resultList!,
              idCallback: idCallback,
            ),
          );
        }
        if (state is MoviesLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MoviesFailedState) {
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(Duration(seconds: 1), () {
                context.read<MoviesListBloc>()..add(MovieListFetched());
              });
            },
            child: MoviesListWidget(
              isHighlited: isHighlited,
              movies: state.resultList,
              idCallback: idCallback,
            ),
          );
        }
        return Center(child: Text(StringConstants.noMovie));
      }),
    );
  }
}
