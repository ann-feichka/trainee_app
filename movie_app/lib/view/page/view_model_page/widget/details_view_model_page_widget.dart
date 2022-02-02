import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';

class DetailsViewModelPageWidget extends StatelessWidget {
  final bool isLandscape;
  const DetailsViewModelPageWidget({Key? key, required this.isLandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AppInstance.detailViewModel.movie,
      builder: (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
        if (snapshot.data != null) {
          return DetailsPageBodyWidget(
              movie: snapshot.data!, isLandScape: isLandscape);
        } else {
          return Scaffold(
            body: Center(
              child: Text(StringConstants.noDetails),
            ),
          );
        }
      },
    );
  }
}
