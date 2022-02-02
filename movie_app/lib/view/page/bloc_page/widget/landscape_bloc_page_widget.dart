import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/details_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/movie_list_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/movies_bloc_page.dart';
import 'package:movie_app/view/page/home_page.dart';

class LandscapeBlocPageWidget extends StatefulWidget {
  final bool isFromMoviesPage;

  const LandscapeBlocPageWidget({Key? key, required this.isFromMoviesPage})
      : super(key: key);

  @override
  _LandscapeBlocPageWidgetState createState() =>
      _LandscapeBlocPageWidgetState();
}

class _LandscapeBlocPageWidgetState extends State<LandscapeBlocPageWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isFromMoviesPage == true) {
      context.read<MovieDetailBloc>()..add(MovieDetailResetEvent());
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.landscapePageTittle),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).popAndPushNamed(HomePage.homePageRoute),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.longestSide / 3,
              child: MovieListBlocBuilder(
                isLandscape: true,
                itemInterceptor: BlocMovieItemInterceptor(context),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.longestSide / 3 * 2,
                child: DetailsBlocBuilder(isLandscape: true)),
          ],
        ));
  }
}
