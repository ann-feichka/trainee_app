import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/landscape_page.dart';
import 'package:movie_app/view/widget/bloc_builder/movie_list_bloc_builder.dart';
import 'package:movie_app/view/widget/movies_list.dart';
import 'package:movie_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  final bool isBloc;

  const MoviesPage({Key? key, required this.isBloc}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesViewModel viewModel = MoviesViewModel();

  @override
  void initState() {
    viewModel.fetchMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Scaffold(
                appBar: AppBar(
                  title: Text(StringConstants().moviesPageTittle),
                  centerTitle: true,
                ),
                body: widget.isBloc
                    ? BlocProvider(
                        create: (_) =>
                            MoviesListBloc()..add(MovieListFetched()),
                        child: MovieListBlocBuilder(
                          isBloc: widget.isBloc,
                          isLandscape: false,
                        ),
                      )
                    : ChangeNotifierProvider<MoviesViewModel>.value(
                        value: viewModel,
                        child: Consumer<MoviesViewModel>(
                          builder: (context, viewModel, _) {
                            if (viewModel.movies == null ||
                                viewModel.movies?.isEmpty == true) {
                              return CircularProgressIndicator();
                            } else {
                              return MoviesList(
                                  movies: movies,
                                  isBloc: widget.isBloc,
                                  isLandscape: false);
                            }
                          },
                        ),
                      ))
            : MovieLandscapePage(isBloc: widget.isBloc, isFromDetail: false);
      },
    );
  }
}
