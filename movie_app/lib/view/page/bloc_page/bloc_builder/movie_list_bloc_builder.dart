import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/movies_list_widget.dart';

class MovieListBlocBuilder extends StatelessWidget {
  final bool isLandscape;
  final bool isFromMoviePage;
  final ItemInterceptor itemInterceptor;
  const MovieListBlocBuilder(
      {Key? key,
      required this.isLandscape,
      required this.itemInterceptor,
      required this.isFromMoviePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListBloc, MoviesState>(builder: (context, state) {
      if (state is MoviesSuccessState) {
        int? _id = InheritedSelector.of(context);
        int? _selectedIndex =
            state.resultList?.movies.indexWhere((element) => element.id == _id);
        return RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              context.read<MoviesListBloc>()..add(MovieListFetched());
            });
          },
          child: MoviesListWidget(
            controller: isFromMoviePage
                ? null
                : ScrollController(
                    initialScrollOffset: 100 * _selectedIndex!.toDouble()),
            selectedIndex: _selectedIndex,
            movies: state.resultList!,
            isLandscape: isLandscape,
            itemInterceptor: itemInterceptor,
          ),
        );
      }
      if (state is MoviesLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is MoviesFailedState) {
        return Center(
          child: Text(StringConstants.error),
        );
      }
      return Center(child: Text("No Movie"));
    });
  }
}
