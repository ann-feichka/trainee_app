import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/details_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/widget/landscape_bloc_page_widget.dart';

class DetailsBlocPage extends StatelessWidget {
  final int? id;

  const DetailsBlocPage({Key? key, required this.id}) : super(key: key);
  static const String detailsPageBlocRoute = "/details_bloc";
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MoviesListBloc>(
              create: (_) =>
                  MoviesListBloc()..add(MovieListFetched(isShuffled: false))),
          BlocProvider<MovieDetailBloc>(
              create: (_) => MovieDetailBloc()..add(MovieDetailFetchEvent(id)))
        ],
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? Scaffold(
                    appBar: AppBar(
                      title: Text(StringConstants.detailsPageTittle),
                      centerTitle: true,
                    ),
                    body: DetailsBlocBuilder(
                      isLandscape: false,
                    ))
                : LandscapeBlocPageWidget(
                    isFromMoviesPage: false,
                  );
          },
        ));
  }
}
