import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/details_page_body.dart';

class DetailsBlocBuilder extends StatelessWidget {
  final bool isLandscape;

  const DetailsBlocBuilder({Key? key, required this.isLandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailsState>(
        builder: (context, state) {
      context.read<MovieDetailBloc>().add(MovieDetailFetchEvent(null));
      if (state is MovieDetailsSuccessState) {
        return DetailsPageBody(movie: state.movie, isLandScape: isLandscape);
      }
      return Center(child: Text(StringConstants().noDetails));
    });
  }
}
