import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/page/view_model_page/movies_view_model_page.dart';
import 'package:movie_app/view/page/view_model_page/widget/movies_view_model_page_widget.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view/widget/landscape_scaffold_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class DetailsLandscapePageWidget extends StatefulWidget {
  final Movie detailsData;
  const DetailsLandscapePageWidget({Key? key, required this.detailsData})
      : super(key: key);

  @override
  _DetailsLandscapePageWidgetState createState() =>
      _DetailsLandscapePageWidgetState();
}

class _DetailsLandscapePageWidgetState
    extends State<DetailsLandscapePageWidget> {
  final MoviesViewModel listViewModel = AppInstance.listViewModel;
  final DetailsViewModel detailsViewModel = AppInstance.detailViewModel;

  @override
  void initState() {
    super.initState();
    _fetchMovie();
  }

  Future<void> _fetchMovie() async {
    await listViewModel.fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return LandscapeScaffoldWidget(
        moviesWidget: MoviesViewModelPageWidget(
          itemInterceptor: ViewModelMovieItemInterceptor(context),
          isLandscape: true,
        ),
        detailsWidget: DetailsPageBodyWidget(
            movie: widget.detailsData, isLandScape: true));
  }
}
