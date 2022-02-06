import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';

class MoviesScaffoldWidget extends StatelessWidget {
  final Widget moviesWidget;
  const MoviesScaffoldWidget({Key? key, required this.moviesWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.moviesPageTittle),
          centerTitle: true,
        ),
        body: moviesWidget);
  }
}
