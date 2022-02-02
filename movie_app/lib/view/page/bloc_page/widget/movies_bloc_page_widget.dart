import 'package:flutter/material.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/movie_list_bloc_builder.dart';

class MoviesBlocPageWidget extends StatelessWidget {
  final ItemInterceptor itemInterceptor;
  const MoviesBlocPageWidget({Key? key, required this.itemInterceptor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.moviesPageTittle),
        centerTitle: true,
      ),
      body: MovieListBlocBuilder(
        isLandscape: false,
        itemInterceptor: itemInterceptor,
      ),
    );
  }
}
