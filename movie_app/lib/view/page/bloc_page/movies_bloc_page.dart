import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/view/page/bloc_page/details_bloc_page.dart';
import 'package:movie_app/view/page/bloc_page/widget/landscape_bloc_page_widget.dart';
import 'package:movie_app/view/page/bloc_page/widget/movies_bloc_page_widget.dart';

class MoviesBlocPage extends StatefulWidget {
  const MoviesBlocPage({Key? key}) : super(key: key);
  static const String moviesPageBlocRoute = "/movies_bloc";

  @override
  _MoviesBlocPageState createState() => _MoviesBlocPageState();
}

class _MoviesBlocPageState extends State<MoviesBlocPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesListBloc>(
            create: (_) =>
                MoviesListBloc()..add(MovieListFetched(isShuffled: false))),
        BlocProvider<MovieDetailBloc>(create: (_) => MovieDetailBloc())
      ],
      child: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? MoviesBlocPageWidget(
                itemInterceptor: BlocMovieItemInterceptor(context),
              )
            : LandscapeBlocPageWidget(
                isFromMoviesPage: true,
              );
      }),
    );
  }
}

class BlocMovieItemInterceptor extends ItemInterceptor {
  final BuildContext context;

  BlocMovieItemInterceptor(this.context);
  @override
  void onClickPortrait(int id) {
    Navigator.of(context)
        .pushNamed(DetailsBlocPage.detailsPageBlocRoute, arguments: id);
  }

  @override
  void onClickLandscape(int id) {
    BlocProvider.of<MovieDetailBloc>(context).add(MovieDetailFetchEvent(id));
  }
}
