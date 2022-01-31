import 'package:flutter/material.dart';
import 'package:movie_app/instanse.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/view/widget/landscape_view_model_page_widget.dart';
import 'package:movie_app/view/widget/movies_view_model_page_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class MoviesViewModelPage extends StatefulWidget {
  const MoviesViewModelPage({Key? key}) : super(key: key);

  @override
  _MoviesViewModelPageState createState() => _MoviesViewModelPageState();
}

class _MoviesViewModelPageState extends State<MoviesViewModelPage> {
  final DetailsViewModel detailViewModel = AppModule.detailViewModel;
  final MoviesViewModel listViewModel = AppModule.listViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? MoviesViewModelPageWidget(
                itemInterceptor: MovieItemInterceptor(context),
                // detailViewModel: detailViewModel,
                isLandscape: false,
              )
            : LandscapeViewModelPageWidget(
                isFromDetailsPage: false,
              );
      }),
    );
  }
}

class MovieItemInterceptor extends ItemInterceptor {
  final BuildContext context;

  MovieItemInterceptor(this.context);
  @override
  void onClick(int id) {
    Navigator.of(context).pushNamed(detailsPageViewModel, arguments: id);
  }
}

abstract class ItemInterceptor {
  void onClick(int id) {}
}
