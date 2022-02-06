import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view/widget/no_details_widget.dart';

class DetailsBlocBuilder extends StatefulWidget {
  final bool isLandscape;

  const DetailsBlocBuilder({Key? key, required this.isLandscape})
      : super(key: key);

  @override
  State<DetailsBlocBuilder> createState() => _DetailsBlocBuilderState();
}

class _DetailsBlocBuilderState extends State<DetailsBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailsState>(
        builder: (context, state) {
      if (state is MovieDetailsSuccessState) {
        return DetailsPageBodyWidget(
            movie: state.movie, isLandScape: widget.isLandscape);
      }
      if (state is MovieDetailsInitialState) {
        return NoDetailsWidget();
      }
      if (state is MovieDetailsFailedState) {
        return Center(
          child: Text(StringConstants.error),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
