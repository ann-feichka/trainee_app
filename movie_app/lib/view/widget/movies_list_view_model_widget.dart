import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/model/popular_movie_response.dart';
import 'package:movie_app/view/widget/movie_list_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class MoviesListViewModelWidget extends StatefulWidget {
  final IdCallback idCallback;
  final bool isHighlited;

  const MoviesListViewModelWidget(
      {Key? key, required this.idCallback, required this.isHighlited})
      : super(key: key);

  @override
  State<MoviesListViewModelWidget> createState() =>
      _MoviesListViewModelWidgetState();
}

class _MoviesListViewModelWidgetState extends State<MoviesListViewModelWidget> {
  final ScrollController controller = ScrollController();
  final MoviesViewModel listViewModel = AppInstance.listViewModel;

  void initState() {
    super.initState();
    _fetchMovie();
  }

  Future<void> _fetchMovie() async {
    await listViewModel.fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PopularMovieResponse?>(
        stream: listViewModel.popularMovieResponse,
        builder: (context, snapshot) {
          int? _id = InheritedSelector.of(context);
          int? _selectedIndex =
              snapshot.data?.movies.indexWhere((element) => element.id == _id);
          return snapshot.data != null
              ? RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        listViewModel.fetchMovieList();
                      });
                    });
                  },
                  child: MoviesListWidget(
                    selectedIndex: _selectedIndex,
                    idCallback: widget.idCallback,
                    isHighlited: widget.isHighlited,
                    movies: snapshot.data!,
                  ),
                )
              : CircularProgressIndicator.adaptive();
        });
  }
}
