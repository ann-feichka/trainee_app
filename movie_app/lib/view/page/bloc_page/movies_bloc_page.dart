import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/movie_list_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/details_bloc_page.dart';
import 'package:movie_app/view/page/bloc_page/widget/landscape_bloc_page_widget.dart';
import 'package:movie_app/view/widget/movies_scaffold_widget.dart';

class MoviesBlocPage extends StatefulWidget {
  const MoviesBlocPage({Key? key}) : super(key: key);
  static const String moviesPageBlocRoute = "/movies_bloc";

  @override
  State<MoviesBlocPage> createState() => _MoviesBlocPageState();
}

class _MoviesBlocPageState extends State<MoviesBlocPage> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesListBloc>()..add(MovieListFetched());
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? MoviesScaffoldWidget(
              moviesWidget: MovieListBlocBuilder(
                isFromMoviePage: true,
                isLandscape: false,
                itemInterceptor: BlocMovieItemInterceptor(context),
              ),
            )
          : LandscapeBlocPageWidget(
              isFromMoviesPage: true,
            );
    });
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
