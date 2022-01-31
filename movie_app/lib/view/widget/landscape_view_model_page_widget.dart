import 'package:flutter/material.dart';
import 'package:movie_app/instanse.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/page/view_model_page/movies_view_model_page.dart';
import 'package:movie_app/view/widget/details_page_body.dart';
import 'package:movie_app/view/widget/movies_view_model_page_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class LandscapeViewModelPageWidget extends StatefulWidget {
  final bool isFromDetailsPage;
  final int? id;
  const LandscapeViewModelPageWidget(
      {Key? key, required this.isFromDetailsPage, this.id})
      : super(key: key);

  @override
  _LandscapeViewModelPageWidgetState createState() =>
      _LandscapeViewModelPageWidgetState();
}

class _LandscapeViewModelPageWidgetState
    extends State<LandscapeViewModelPageWidget> {
  final DetailsViewModel detailViewModel = AppModule.detailViewModel;
  final MoviesViewModel listViewModel = AppModule.listViewModel;

  @override
  void initState() {
    listViewModel.fetchMovieList();
    widget.isFromDetailsPage
        ? detailViewModel.fetchMovieDetails(widget.id)
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(StringConstants().landscapePageTittle),
        //   centerTitle: true,
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
        //         homePage, (route) => route == homePage),
        //   ),
        // ),
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.longestSide / 3,
            child: MoviesViewModelPageWidget(
              itemInterceptor: MovieItemInterceptor(context),
              isLandscape: true,
              // detailViewModel: detailViewModel,
            )),
        Container(
            width: MediaQuery.of(context).size.longestSide / 3 * 2,
            child: StreamBuilder(
              stream: detailViewModel.movie,
              builder: (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
                if (snapshot.data != null) {
                  return DetailsPageBody(
                      movie: snapshot.data!, isLandScape: true);
                } else {
                  return CircularProgressIndicator();
                }
              },
            )),
      ],
    ));
  }
}
