import 'package:flutter/material.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view/widget/no_details_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class DetailsVMWidget extends StatefulWidget {
  final int? id;
  const DetailsVMWidget({Key? key, this.id}) : super(key: key);

  @override
  _DetailsVMWidgetState createState() => _DetailsVMWidgetState();
}

class _DetailsVMWidgetState extends State<DetailsVMWidget> {
  late final DetailsViewModel detailViewModel;
  int? _currentMovie;
  @override
  void didChangeDependencies() {
    _currentMovie = InheritedSelector.of(context);
    _fetchDetails(_currentMovie);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    detailViewModel.closeStream();
    super.dispose();
  }

  @override
  void initState() {
    detailViewModel = DetailsViewModel();
    super.initState();
    _fetchDetails(widget.id);
  }

  Future<void> _fetchDetails(int? id) async {
    await detailViewModel.fetchMovieDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse?>(
        stream: detailViewModel.movie,
        builder: (context, snapshot) {
          if (snapshot.data?.error != null) {
            return Center(
              child: Text(StringConstants.error),
            );
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return NoDetailsWidget();
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return DetailsPageBodyWidget(movie: snapshot.data!);
              case ConnectionState.done:
                return DetailsPageBodyWidget(movie: snapshot.data!);
            }
          }
        });
  }
}
