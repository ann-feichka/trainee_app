import 'package:flutter/material.dart';
import 'package:movie_app/instanse.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/view/page/view_model_page/movies_view_model_page.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';
import 'package:movie_app/view_model/view_model.dart';

class MoviesViewModelPageWidget extends StatefulWidget {
  final bool isLandscape;
  final ItemInterceptor itemInterceptor;
  const MoviesViewModelPageWidget(
      {Key? key, required this.isLandscape, required this.itemInterceptor})
      : super(key: key);

  @override
  _MoviesViewModelPageWidgetState createState() =>
      _MoviesViewModelPageWidgetState();
}

class _MoviesViewModelPageWidgetState extends State<MoviesViewModelPageWidget> {
  final DetailsViewModel detailViewModel = AppModule.detailViewModel;
  final MoviesViewModel listViewModel = AppModule.listViewModel;
  @override
  void initState() {
    listViewModel.fetchMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listViewModel.movies,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>?> snapshot) {
        if (snapshot.data == null || snapshot.data?.isEmpty == true) {
          return CircularProgressIndicator();
        } else {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              Movie movie = snapshot.data![index];
              return Container(
                child: InkWell(
                    onTap: () => widget.itemInterceptor.onClick(movie.id),
                    child: MovieCard(
                      movie: movie,
                      isLandscape: widget.isLandscape,
                    )),
              );
            },
          );
        }
      },
    );
  }
}

_navigateToDetailsPage(BuildContext context, int id) {
  Navigator.of(context).pushNamed(detailsPageViewModel, arguments: id);
}
