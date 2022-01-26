import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:movie_app/pages/movie_landscape_page.dart';
import 'package:movie_app/pages/widget/card_movies.dart';
import 'package:movie_app/pages/widget/movie_list_bloc_builder.dart';
import 'package:movie_app/pages/widget/movies_list.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/view_model/movies_list_view_model.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  final bool isBloc;

  const MoviesPage({Key? key, required this.isBloc}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesListViewModel viewModel = MoviesListViewModel();

  @override
  void initState() {
    viewModel.getMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait ? Scaffold(
            appBar: AppBar(
              title: Text("Movies"),
              centerTitle: true,
            ),
            body: widget.isBloc ?
            BlocProvider(
              create: (_) =>
              MovieListBloc()
                ..add(MovieListFetched()),
              child: MovieListBlocBuilder(
                isBloc: widget.isBloc, isLandscape: false,),
            ) :
            ChangeNotifierProvider<MoviesListViewModel>.value(
              value: viewModel,
              child: Consumer<MoviesListViewModel>(
                builder: (context, viewModel, _) {
                  if (viewModel.movies == null ||
                      viewModel.movies?.isEmpty == true) {
                    return CircularProgressIndicator();
                  } else {
                    return MoviesList(movies: viewModel.movies!,
                      isBloc: widget.isBloc,
                      isLandscape: false,);
                  }
                },
              ),
            )):
            MovieLandscapePage(isBloc: widget.isBloc, isLandscape: true,
            isFromDetail: false);
      },
    );
  }
}

// Widget buildList(List<Movie> movies) {
//   return ListView.builder(
//     itemCount: movies.length,
//     itemBuilder: (BuildContext context, int index) {
//       Movie movie = movies[index];
//       return CardMovies(movie: movie);
//     },
//   );
// }

Widget _buildMovieCard({required BuildContext context,
  required Movie movie,
  required bool isBloc}) {
  return Card(
    child: ListTile(
        title: Text(movie.title),
        onTap: () => _sendDataToMovieDetailScreen(context, isBloc, movie)),
  );
}

void _sendDataToMovieDetailScreen(BuildContext context, bool isBloc,
    Movie movie) {
  Navigator.of(context).pushNamed(detailsPage,
      arguments: MovieDetailsArguments(isBloc: false, movieId: movie.id));
}
