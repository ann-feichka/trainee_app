import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/model/popular_movie_response.dart';
import 'package:movie_app/view/widget/movies_list_widget.dart';

class MoviesViewModelPageWidget extends StatefulWidget {
  final bool isLandscape;
  final ItemInterceptor itemInterceptor;
  const MoviesViewModelPageWidget({
    Key? key,
    required this.isLandscape,
    required this.itemInterceptor,
  }) : super(key: key);

  @override
  State<MoviesViewModelPageWidget> createState() =>
      _MoviesViewModelPageWidgetState();
}

class _MoviesViewModelPageWidgetState extends State<MoviesViewModelPageWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AppInstance.listViewModel.popularMovieResponse,
      builder: (BuildContext context,
          AsyncSnapshot<PopularMovieResponse?> snapshot) {
        if (snapshot.data?.movies == null ||
            snapshot.data?.movies.isEmpty == true) {
          return CircularProgressIndicator();
        } else {
          int? id = InheritedSelector.of(context);
          int? selectedIndex =
              snapshot.data!.movies.indexWhere((element) => element.id == id);
          return MoviesListWidget(
              controller: ScrollController(
                  initialScrollOffset: 100 * selectedIndex.toDouble()),
              selectedIndex: selectedIndex,
              movies: snapshot.data!,
              isLandscape: widget.isLandscape,
              itemInterceptor: widget.itemInterceptor);
        }
      },
    );
  }
}
