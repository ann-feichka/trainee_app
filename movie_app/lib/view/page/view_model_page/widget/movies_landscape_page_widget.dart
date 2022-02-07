import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/popular_movie_response.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view/widget/landscape_scaffold_widget.dart';
import 'package:movie_app/view/widget/movies_list_widget.dart';
import 'package:movie_app/view/widget/no_details_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class MoviesLandscapePageWidget extends StatefulWidget {
  final PopularMovieResponse? moviesData;
  final ItemInterceptor itemInterceptor;
  const MoviesLandscapePageWidget(
      {Key? key, this.moviesData, required this.itemInterceptor})
      : super(key: key);

  @override
  _MoviesLandscapePageWidgetState createState() =>
      _MoviesLandscapePageWidgetState();
}

class _MoviesLandscapePageWidgetState extends State<MoviesLandscapePageWidget> {
  final MoviesViewModel listViewModel = AppInstance.listViewModel;
  final DetailsViewModel detailsViewModel = AppInstance.detailViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int? _id;
    return StreamBuilder<Movie?>(
        stream: detailsViewModel.movie,
        builder: (context, snapshot) {
          _id = snapshot.data?.id;
          int? _selectedIndex = widget.moviesData!.movies
              .indexWhere((element) => element.id == _id);
          return InheritedSelector(
            id: _id,
            child: LandscapeScaffoldWidget(
                moviesWidget: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: 1), () {
                      listViewModel.fetchMovieList();
                    });
                  },
                  child: MoviesListWidget(
                    selectedIndex: _selectedIndex,
                    movies: widget.moviesData!,
                    isLandscape: true,
                    itemInterceptor: widget.itemInterceptor,
                  ),
                ),
                detailsWidget: snapshot.data != null
                    ? DetailsPageBodyWidget(
                        isLandScape: true,
                        movie: snapshot.data!,
                      )
                    : NoDetailsWidget()),
          );
        });
  }
}
