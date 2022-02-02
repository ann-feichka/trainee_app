import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/widget/movies_list_widget.dart';

class MoviesViewModelPageWidget extends StatelessWidget {
  final bool isLandscape;
  final ItemInterceptor itemInterceptor;
  const MoviesViewModelPageWidget(
      {Key? key, required this.isLandscape, required this.itemInterceptor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? id = InheritedSelector.of(context);
    return StreamBuilder(
      stream: AppInstance.listViewModel.movies,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>?> snapshot) {
        if (snapshot.data == null || snapshot.data?.isEmpty == true) {
          return CircularProgressIndicator();
        } else {
          return MoviesListWidget(
              selectedIndex:
                  snapshot.data!.indexWhere((element) => element.id == id),
              movies: snapshot.data!,
              isLandscape: isLandscape,
              itemInterceptor: itemInterceptor);
        }
      },
    );
  }
}
