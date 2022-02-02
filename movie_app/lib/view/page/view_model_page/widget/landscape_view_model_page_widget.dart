import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/home_page.dart';
import 'package:movie_app/view/page/view_model_page/movies_view_model_page.dart';
import 'package:movie_app/view/page/view_model_page/widget/details_view_model_page_widget.dart';
import 'package:movie_app/view/page/view_model_page/widget/movies_view_model_page_widget.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class LandscapeViewModelPageWidget extends StatefulWidget {
  final bool isFromDetailsPage;
  final Movie? detailsData;
  final List<Movie?>? moviesData;
  const LandscapeViewModelPageWidget(
      {Key? key,
      required this.isFromDetailsPage,
      this.detailsData,
      this.moviesData})
      : super(key: key);

  @override
  _LandscapeViewModelPageWidgetState createState() =>
      _LandscapeViewModelPageWidgetState();
}

class _LandscapeViewModelPageWidgetState
    extends State<LandscapeViewModelPageWidget> {
  final MoviesViewModel listViewModel = AppInstance.listViewModel;

  @override
  void initState() {
    listViewModel.fetchMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                child: MoviesViewModelPageWidget(
                  itemInterceptor: ViewModelMovieItemInterceptor(context),
                  isLandscape: true,
                )),
            Container(
                width: MediaQuery.of(context).size.longestSide / 3 * 2,
                child: widget.isFromDetailsPage
                    ? DetailsPageBodyWidget(
                        movie: widget.detailsData!, isLandScape: true)
                    : DetailsViewModelPageWidget(isLandscape: true)),
          ],
        ));
  }
}
