
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_state.dart';
import 'package:movie_app/pages/widget/movies_list.dart';

class MovieListBlocBuilder extends StatelessWidget {
  final bool isBloc;
  final bool isLandscape;
  final onTap;
  const MovieListBlocBuilder({Key? key, required this.isBloc, required this.isLandscape, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc,MovieListState>(builder: (context,state){
      if(state is MovieListSuccessState){
        return MoviesList(movies: state.resultList!,isBloc: isBloc,isLandscape:isLandscape,onTap: onTap,);
      }
      if(state is MovieListLoadingState){
        return CircularProgressIndicator.adaptive();
      }
      return Center(child:Text("No Movie"));
    });
  }
}
