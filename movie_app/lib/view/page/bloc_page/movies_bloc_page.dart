import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/view/page/bloc_page/widget/landscape_bloc_page_widget.dart';
import 'package:movie_app/view/page/bloc_page/widget/movies_bloc_page_widget.dart';

class MoviesBlocPage extends StatefulWidget {
  const MoviesBlocPage({Key? key}) : super(key: key);

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
            ? MoviesBlocPageWidget()
            : LandscapeBlocPageWidget(
                isFromMoviesPage: true,
              );
      }),
    );
  }
}
