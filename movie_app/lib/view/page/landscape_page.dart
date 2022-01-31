// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
// import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
// import 'package:movie_app/model/movie.dart';
// import 'package:movie_app/routes.dart';
// import 'package:movie_app/string_constants.dart';
// import 'package:movie_app/view/widget/card/movie_card.dart';
// import 'package:movie_app/view/widget/details_page_body.dart';
// import 'package:movie_app/view_model/view_model.dart';
// import 'package:provider/provider.dart';
//
// class MovieLandscapePage extends StatefulWidget {
//   final bool isBloc;
//   final int? movieId;
//   final bool isFromDetail;
//
//   const MovieLandscapePage(
//       {Key? key,
//       required this.isBloc,
//       this.movieId,
//       required this.isFromDetail})
//       : super(key: key);
//
//   @override
//   _MovieLandscapePageState createState() => _MovieLandscapePageState(movieId);
// }
//
// class _MovieLandscapePageState extends State<MovieLandscapePage> {
//   bool isLandscape = true;
//   int? id;
//   int? selectedIndex;
//   final DetailsViewModel detailViewModel = DetailsViewModel();
//   final MoviesViewModel listViewModel = MoviesViewModel();
//
//   _MovieLandscapePageState(this.id);
//
//   @override
//   void initState() {
//     listViewModel.fetchMovieList();
//     detailViewModel.fetchMovieDetails(id);
//     widget.isFromDetail
//         ? selectedIndex = listViewModel.movies!
//             .indexWhere((element) => element.id == detailViewModel.movie!.id)
//         : () {};
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => MovieDetailBloc()..add(MovieDetailFetchEvent(id)),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(StringConstants().landscapePageTittle),
//             centerTitle: true,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
//                   homePage, (route) => route == homePage),
//             ),
//           ),
//           body: Row(
//             children: <Widget>[
//               Container(
//                   width: MediaQuery.of(context).size.longestSide / 3,
//                   child: widget.isBloc
//                       ? BlocProvider(
//                           create: (_) => MoviesListBloc()
//                             ..add(MovieListFetched(isShuffled: false)),
//                           child: BlocBuilder<MoviesListBloc, MoviesListState>(
//                               builder: (context, state) {
//                             if (state is MoviesSuccessState) {
//                               return ListView.builder(
//                                 physics: BouncingScrollPhysics(),
//                                 itemCount: state.resultList!.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   Movie movie = state.resultList![index];
//                                   return Container(
//                                     color: selectedIndex == index
//                                         ? Colors.deepOrangeAccent
//                                         : null,
//                                     child: InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           id = movie.id;
//                                           selectedIndex = index;
//                                         });
//                                         context.read<MovieDetailBloc>().add(
//                                             MovieDetailFetchEvent(movie.id));
//                                       },
//                                       child: MovieCard(
//                                         movie: movie,
//                                         isLandscape: isLandscape,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             }
//                             if (state is MoviesLoadingState) {
//                               return CircularProgressIndicator.adaptive();
//                             }
//                             return Center(
//                                 child: Text(StringConstants().noMovie));
//                           }),
//                         )
//                       : ChangeNotifierProvider<MoviesViewModel>.value(
//                           value: listViewModel,
//                           child: Consumer<MoviesViewModel>(
//                             builder: (context, viewModel, _) {
//                               if (listViewModel.movies == null ||
//                                   listViewModel.movies?.isEmpty == true) {
//                                 return CircularProgressIndicator();
//                               } else {
//                                 return ListView.builder(
//                                   physics: BouncingScrollPhysics(),
//                                   itemCount: listViewModel.movies!.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     Movie movieVM =
//                                         listViewModel.movies![index];
//                                     return Container(
//                                       color: selectedIndex == index
//                                           ? Colors.deepOrangeAccent
//                                           : null,
//                                       child: InkWell(
//                                           onTap: () {
//                                             detailViewModel
//                                                 .fetchMovieDetails(movieVM.id);
//                                             setState(() {
//                                               selectedIndex = index;
//                                             });
//                                           },
//                                           child: MovieCard(
//                                             movie: movieVM,
//                                             isLandscape: isLandscape,
//                                           )),
//                                     );
//                                   },
//                                 );
//                               }
//                             },
//                           ),
//                         )),
//               Container(
//                 width: MediaQuery.of(context).size.longestSide / 3 * 2,
//                 child: widget.isBloc
//                     ? BlocBuilder<MovieDetailBloc, MovieDetailsState>(
//                         builder: (_, state) {
//                           if (state is MovieDetailsSuccessState) {
//                             return DetailsPageBody(
//                                 movie: state.movie, isLandScape: isLandscape);
//                           }
//                           return Center(
//                               child: Text(StringConstants().chooseMovie));
//                         },
//                       )
//                     : ChangeNotifierProvider<DetailsViewModel>.value(
//                         value: detailViewModel,
//                         child: Consumer<DetailsViewModel>(
//                           builder: (context, detailViewModel, _) {
//                             if (detailViewModel.movie != null) {
//                               return DetailsPageBody(
//                                 movie: detailViewModel.movie!,
//                                 isLandScape: true,
//                               );
//                             }
//                             return Center(
//                               child: Text(StringConstants().chooseMovie),
//                             );
//                           },
//                         ),
//                       ),
//               )
//             ],
//           ),
//         ));
//   }
// }
