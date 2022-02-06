import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/view_model_page/widget/details_landscape_page_widget.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view_model/details_view_model.dart';

class DetailsViewModelPage extends StatefulWidget {
  final int? id;
  static const String detailsPageViewModelRoute = "/details_view_model";
  const DetailsViewModelPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsViewModelPageState createState() => _DetailsViewModelPageState();
}

class _DetailsViewModelPageState extends State<DetailsViewModelPage> {
  final DetailsViewModel detailViewModel = AppInstance.detailViewModel;

  @override
  void initState() {
    super.initState();
    widget.id != null ? _fetchDetails() : null;
  }

  _fetchDetails() async {
    await detailViewModel.fetchMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Movie?>(
        stream: detailViewModel.movie,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? InheritedSelector(
                  id: snapshot.data?.id,
                  child: OrientationBuilder(builder: (context, orientation) {
                    return orientation == Orientation.portrait
                        ? Scaffold(
                            appBar: AppBar(
                              title: Text(StringConstants.detailsPageTittle),
                            ),
                            body: DetailsPageBodyWidget(
                                movie: snapshot.data!, isLandScape: false))
                        : DetailsLandscapePageWidget(
                            detailsData: snapshot.data,
                          );
                  }),
                )
              : Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        });
  }
}
