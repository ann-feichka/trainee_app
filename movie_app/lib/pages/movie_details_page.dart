import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_event.dart';
import 'package:movie_app/pages/movie_landscape_page.dart';
import 'package:movie_app/pages/widget/detail_page_body.dart';
import 'package:movie_app/pages/widget/movie_details_bloc_builder.dart';
import 'package:movie_app/view_model/movie_details_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsArguments {
  final bool isBloc;
  final int movieId;

  MovieDetailsArguments({required this.isBloc, required this.movieId});
}

class MovieDetailsPage extends StatefulWidget {
  final MovieDetailsArguments arguments;

  const MovieDetailsPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  void initState() {
    viewModel.getMovie(widget.arguments.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context,orientation){
        return orientation==Orientation.portrait? Scaffold(
      appBar: AppBar(
        title: Text(viewModel.movie!.title),
        centerTitle: true,
      ),
      body: widget.arguments.isBloc?BlocProvider(
              create: (_) => MovieDetailBloc()..add(MovieDetailFetch(id:widget.arguments.movieId)),
              child: MovieDetailsBlocBuilder(isLandscape: false,)
          ):
          ChangeNotifierProvider<MovieDetailsViewModel>.value(
            value: viewModel,
            child: Consumer<MovieDetailsViewModel>(
              builder: (context, viewModel, _) {
                if (viewModel.movie != null) {
                  return DetailsPageBody(movie:viewModel.movie!,isLandScape: false,);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )):MovieLandscapePage(isBloc: widget.arguments.isBloc, isLandscape: true, isFromDetail: true,movieId:viewModel.movie!.id);
        },
    );
  }
}
