import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/view_model_page/details_view_model_page.dart';
import 'package:movie_app/view/page/view_model_page/widget/landscape_view_model_page_widget.dart';
import 'package:movie_app/view/widget/movies_list_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class MoviesViewModelPage extends StatefulWidget {
  const MoviesViewModelPage({Key? key}) : super(key: key);
  static const String moviesPageViewModelRoute = "/movies_view_model";

  @override
  _MoviesViewModelPageState createState() => _MoviesViewModelPageState();
}

class _MoviesViewModelPageState extends State<MoviesViewModelPage> {
  final DetailsViewModel detailViewModel = AppInstance.detailViewModel;
  final MoviesViewModel listViewModel = AppInstance.listViewModel;

  @override
  void initState() {
    listViewModel.fetchMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Movie>?>(
        stream: listViewModel.movies,
        builder: (context, snapshot) {
          return OrientationBuilder(builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? Scaffold(
                    appBar: AppBar(
                      title: Text(StringConstants.moviesPageTittle),
                      centerTitle: true,
                    ),
                    body: MoviesListWidget(
                      movies: snapshot.data!,
                      isLandscape: false,
                      itemInterceptor: ViewModelMovieItemInterceptor(context),
                    ))
                : LandscapeViewModelPageWidget(
                    isFromDetailsPage: false,
                  );
          });
        });
  }
}

class ViewModelMovieItemInterceptor extends ItemInterceptor {
  final BuildContext context;

  ViewModelMovieItemInterceptor(this.context);

  @override
  void onClickPortrait(int id) {
    Navigator.of(context).pushNamed(
        DetailsViewModelPage.detailsPageViewModelRoute,
        arguments: id);
  }

  @override
  void onClickLandscape(int id) {
    AppInstance.detailViewModel.fetchMovieDetails(id);
  }
}
