import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/string_constants.dart';
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
  StreamSubscription? _subscription;
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _subscription = listViewModel.errors.listen((error) {
      if (error != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error)));
      }
    });
    super.initState();
    _fetchMovie();
  }

  Future<void> _fetchMovie() async {
    await listViewModel.fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PopularMovieModel?>(
        stream: listViewModel.popularMovieResponse,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text(StringConstants.noMovie),
              );
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              if (snapshot.data?.movies == null) {
                return Center(
                  child: Text("Error"),
                );
              }
              return _showMoviesList(snapshot.data!);
            case ConnectionState.done:
              return _showMoviesList(snapshot.data!);
          }
        });
  }

  Widget _showMoviesList(PopularMovieModel movieResponse) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1), () {
          setState(() {
            listViewModel.fetchMovieList();
          });
        });
      },
      child: MoviesListWidget(
        idCallback: widget.idCallback,
        isHighlited: widget.isHighlited,
        movies: movieResponse,
      ),
    );
  }
}
