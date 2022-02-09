import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class DetailsVMWidget extends StatefulWidget {
  final int? id;
  const DetailsVMWidget({Key? key, this.id}) : super(key: key);

  @override
  _DetailsVMWidgetState createState() => _DetailsVMWidgetState();
}

class _DetailsVMWidgetState extends State<DetailsVMWidget> {
  final DetailsViewModel detailViewModel = AppInstance.detailViewModel;
  int? _currentMovie;
  @override
  void didChangeDependencies() {
    _currentMovie = InheritedSelector.of(context);
    _fetchDetails(_currentMovie);
    super.didChangeDependencies();
  }

  @override
  void initState() {
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
          return snapshot.data != null
              ? DetailsPageBodyWidget(movie: snapshot.data!)
              : CircularProgressIndicator();
        });
  }
}
