import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/details_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/movie_list_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/movies_bloc_page.dart';
import 'package:movie_app/view/widget/landscape_scaffold_widget.dart';

class LandscapeBlocPageWidget extends StatefulWidget {
  final bool isFromMoviesPage;

  const LandscapeBlocPageWidget({Key? key, required this.isFromMoviesPage})
      : super(key: key);

  @override
  _LandscapeBlocPageWidgetState createState() =>
      _LandscapeBlocPageWidgetState();
}

class _LandscapeBlocPageWidgetState extends State<LandscapeBlocPageWidget> {
  int? _selectId;

  @override
  void initState() {
    super.initState();
    if (widget.isFromMoviesPage == true) {
      context.read<MovieDetailBloc>()..add(MovieDetailResetEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailsState>(
        builder: (context, state) {
      if (state is MovieDetailsSuccessState) {
        _selectId = state.movie.id;
      }
      if (state is MovieDetailsInitialState) {
        _selectId = null;
      }
      return InheritedSelector(
        id: _selectId,
        child: LandscapeScaffoldWidget(
            moviesWidget: MovieListBlocBuilder(
              isFromMoviePage: widget.isFromMoviesPage,
              isLandscape: true,
              itemInterceptor: BlocMovieItemInterceptor(context),
            ),
            detailsWidget: DetailsBlocBuilder(isLandscape: true)),
      );
    });
  }
}
