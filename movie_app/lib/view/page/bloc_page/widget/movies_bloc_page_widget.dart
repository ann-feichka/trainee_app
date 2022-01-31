import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/movie_list_bloc_builder.dart';

class MoviesBlocPageWidget extends StatelessWidget {
  const MoviesBlocPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants().moviesPageTittle),
        centerTitle: true,
      ),
      body: MovieListBlocBuilder(
        isLandscape: false,
        onTap: () {},
      ),
    );
  }
}
