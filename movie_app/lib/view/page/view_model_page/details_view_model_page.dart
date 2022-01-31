import 'package:flutter/material.dart';
import 'package:movie_app/instanse.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/widget/details_page_body.dart';
import 'package:movie_app/view/widget/landscape_view_model_page_widget.dart';
import 'package:movie_app/view_model/details_view_model.dart';

class DetailsViewModelPage extends StatefulWidget {
  final int? id;

  const DetailsViewModelPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsViewModelPageState createState() => _DetailsViewModelPageState();
}

class _DetailsViewModelPageState extends State<DetailsViewModelPage> {
  final DetailsViewModel detailViewModel = AppModule.detailViewModel;

  @override
  void initState() {
    detailViewModel.fetchMovieDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? StreamBuilder(
                  stream: detailViewModel.movie,
                  builder:
                      (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
                    if (snapshot.data != null) {
                      return DetailsPageBody(
                          movie: snapshot.data!, isLandScape: false);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : LandscapeViewModelPageWidget(
                  isFromDetailsPage: true,
                  id: widget.id,
                );
        }));
  }
}
