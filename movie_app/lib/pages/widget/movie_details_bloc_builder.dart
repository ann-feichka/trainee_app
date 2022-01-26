
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_state.dart';
import 'package:movie_app/pages/widget/detail_page_body.dart';

class MovieDetailsBlocBuilder extends StatelessWidget {

  final bool isLandscape;
  const MovieDetailsBlocBuilder({Key? key, required this.isLandscape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc,MovieDetailState>(builder: (context,state){
      if(state is MovieDetailSuccessState){
        return DetailsPageBody(movie: state.movie!,isLandScape:isLandscape);
      }
      return Center(child:Text("No Details"));
    });
  }
}
