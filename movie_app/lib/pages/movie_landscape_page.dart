import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_bloc.dart';
import 'package:movie_app/bloc/details_bloc/movie_detail_event.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_event.dart';
import 'package:movie_app/bloc/movies_bloc/movie_list_state.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/widget/detail_page_body.dart';
import 'package:movie_app/pages/widget/genres.dart';
import 'package:movie_app/pages/widget/movie_details_bloc_builder.dart';
import 'package:movie_app/view_model/movie_details_view_model.dart';
import 'package:movie_app/view_model/movies_list_view_model.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import 'movie_details_page.dart';

class MovieLandscapePage extends StatefulWidget {
  final bool isLandscape;
  final bool isBloc;
  final int? movieId;
  final bool isFromDetail;

  const MovieLandscapePage(
      {Key? key,
      required this.isBloc,
      required this.isLandscape,
      this.movieId,
      required this.isFromDetail})
      : super(key: key);

  @override
  _MovieLandscapePageState createState() => _MovieLandscapePageState();
}

class _MovieLandscapePageState extends State<MovieLandscapePage> {
  int? selectedIndex;
  final MovieDetailsViewModel detailViewModel = MovieDetailsViewModel();
  final MoviesListViewModel listViewModel = MoviesListViewModel();

  @override
  void initState() {
    listViewModel.getMovieList();
    detailViewModel.getMovie(widget.movieId);
    widget.isFromDetail
        ? selectedIndex = listViewModel.movies!
            .indexWhere((element) => element.id == detailViewModel.movie!.id)
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies & Details"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(homePage, (route) => route == homePage),
        ),
      ),
      body: Row(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.longestSide / 3,
              child: widget.isBloc
                  ? BlocProvider(
                      create: (_) => MovieListBloc()..add(MovieListFetched()),
                      child: BlocBuilder<MovieListBloc, MovieListState>(
                          builder: (context, state) {
                        if (state is MovieListSuccessState) {
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: state.resultList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Movie movie = state.resultList![index];
                              return Container(
                                color: selectedIndex == index
                                    ? Colors.deepOrangeAccent
                                    : null,
                                child: InkWell(
                                  // highlightColor: Colors.deepOrangeAccent,
                                  onTap: widget.isLandscape
                                      ?()=>context.read<MovieDetailBloc>().add(
                                              MovieDetailFetch(id: movie.id))
                                          // setState(() {
                                          //   selectedIndex = index;
                                          // });
                                      // movieId= movie.id;
                                      // context.read<MovieDetailBloc>().add(MovieDetailFetch(id:movie.id));
                                      // viewModel.getMovie(movieId);;
                                      // context.read<MovieDetailBloc>().add(MovieDetailFetch(id:movie.id));
                                      : () {
                                          Navigator.of(context).pushNamed(
                                              detailsPage,
                                              arguments: MovieDetailsArguments(
                                                  isBloc: widget.isBloc,
                                                  movieId: movie.id));
                                        },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: CachedNetworkImage(
                                              width: widget.isLandscape
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      10
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                              height: widget.isLandscape
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      10
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                              fit: BoxFit.cover,
                                              imageUrl: movie.poster,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator
                                                      .adaptive(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Text("Error"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                  movie.title,
                                                  style: widget.isLandscape
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .headline5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 15.0),
                                                child: Text(
                                                  '${movie.year}',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                              ),
                                              widget.isLandscape
                                                  ? Container()
                                                  : Genres(movie: movie),
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        if (state is MovieListLoadingState) {
                          return CircularProgressIndicator.adaptive();
                        }
                        return Center(child: Text("No Movie"));
                      }),
                    )
                  : ChangeNotifierProvider<MoviesListViewModel>.value(
                      value: listViewModel,
                      child: Consumer<MoviesListViewModel>(
                        builder: (context, viewModel, _) {
                          if (listViewModel.movies == null ||
                              listViewModel.movies?.isEmpty == true) {
                            return CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: listViewModel.movies!.length,
                              itemBuilder: (BuildContext context, int index) {
                                Movie movie = listViewModel.movies![index];
                                return Container(
                                  color: selectedIndex == index
                                      ? Colors.deepOrangeAccent
                                      : null,
                                  child: InkWell(
                                    // highlightColor: Colors.deepOrangeAccent,
                                    onTap: widget.isLandscape
                                        ? () {
                                            detailViewModel.getMovie(movie.id);
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          }
                                        // movieId= movie.id;
                                        // context.read<MovieDetailBloc>().add(MovieDetailFetch(id:movie.id));
                                        // viewModel.getMovie(movieId);;
                                        // context.read<MovieDetailBloc>().add(MovieDetailFetch(id:movie.id));
                                        : () {
                                            Navigator.of(context).pushNamed(
                                                detailsPage,
                                                arguments:
                                                    MovieDetailsArguments(
                                                        isBloc: widget.isBloc,
                                                        movieId: movie.id));
                                          },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: CachedNetworkImage(
                                                width: widget.isLandscape
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        10
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        3,
                                                height: widget.isLandscape
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        10
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        3,
                                                fit: BoxFit.cover,
                                                imageUrl: movie.poster,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator
                                                        .adaptive(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Text("Error"),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                    movie.title,
                                                    style: widget.isLandscape
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .headline6
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 15.0),
                                                  child: Text(
                                                    '${movie.year}',
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                widget.isLandscape
                                                    ? Container()
                                                    : Genres(movie: movie),
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    )),
          Container(
            width: MediaQuery.of(context).size.longestSide / 3 * 2,
            child:widget.isBloc?BlocProvider(
                create: (_) =>
                MovieDetailBloc()..add(MovieDetailFetch(id: widget.movieId)),
                child: MovieDetailsBlocBuilder(isLandscape: true,)
            ):ChangeNotifierProvider<MovieDetailsViewModel>.value(
              value: detailViewModel,
              child: Consumer<MovieDetailsViewModel>(
                builder: (context, detailViewModel, _) {
                  if (detailViewModel.movie != null) {
                    return DetailsPageBody(
                      movie: detailViewModel.movie!,
                      isLandScape: true,
                    );
                  } else {
                    return Center(
                      child: Text("Choose movie!"),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
