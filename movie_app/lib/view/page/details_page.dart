// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
// import 'package:movie_app/view/widget/bloc_builder/details_bloc_builder.dart';
// import 'package:movie_app/view/widget/details_page_body.dart';
// import 'package:movie_app/view_model/details_view_model.dart';
// import 'package:movie_app/view_model/view_model.dart';
// import 'package:provider/provider.dart';
//
// class MovieDetailsArguments {
//   final bool isBloc;
//   final int? id;
//
//   MovieDetailsArguments({
//     required this.id,
//     required this.isBloc,
//   });
// }
//
// class MovieDetailsPage extends StatefulWidget {
//   final MovieDetailsArguments arguments;
//
//   const MovieDetailsPage({Key? key, required this.arguments}) : super(key: key);
//
//   @override
//   _MovieDetailsPageState createState() => _MovieDetailsPageState();
// }
//
// class _MovieDetailsPageState extends State<MovieDetailsPage> {
//   final DetailsViewModel viewModel = DetailsViewModel();
//
//   @override
//   void initState() {
//     _fetchDetails();
//     super.initState();
//   }
//
//   Future<void> _fetchDetails() async {
//     await viewModel.fetchMovieDetails(3);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         return orientation == Orientation.portrait
//             ? Scaffold(
//                 // appBar: AppBar(
//                 //   title: Text(viewModel.movie!.title),
//                 //   centerTitle: true,
//                 // ),
//                 body: widget.arguments.isBloc
//                     ? BlocProvider(
//                         create: (_) => MovieDetailBloc()
//                           ..add(MovieDetailFetchEvent(widget.arguments.id)),
//                         child: DetailsBlocBuilder(
//                           isLandscape: false,
//                         ))
//                     : ChangeNotifierProvider<DetailsViewModel>.value(
//                         value: viewModel,
//                         child: Consumer<DetailsViewModel>(
//                           builder: (context, viewModel, _) {
//                             if (viewModel.movie != null) {
//                               return DetailsPageBody(
//                                 movie: viewModel.movie!,
//                                 isLandScape: false,
//                               );
//                             } else {
//                               return CircularProgressIndicator();
//                             }
//                           },
//                         ),
//                       ))
//             : MovieLandscapePage(
//                 isBloc: widget.arguments.isBloc,
//                 isFromDetail: true,
//                 movieId: viewModel.movie!.id);
//       },
//     );
//   }
// }
