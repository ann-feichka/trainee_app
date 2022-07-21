import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/view/page/view_model_page/details_view_model_page.dart';
import 'package:movie_app/view/page/view_model_page/widget/details_v_m_widget.dart';
import 'package:movie_app/view/page/view_model_page/widget/movies_list_view_model_widget.dart';
import 'package:movie_app/view/widget/movies_scaffold_widget.dart';
import 'package:movie_app/view_model/view_model.dart';

class MoviesViewModelPage extends StatefulWidget {
  const MoviesViewModelPage({Key? key}) : super(key: key);
  static const String moviesPageViewModelRoute = "/movies_view_model";

  @override
  _MoviesViewModelPageState createState() => _MoviesViewModelPageState();
}

class _MoviesViewModelPageState extends State<MoviesViewModelPage> {
  // final DetailsViewModel detailViewModel = AppInstance.detailViewModel;
  final MoviesViewModel listViewModel = AppInstance.listViewModel;
  int? _selectId;

  @override
  void initState() {
    super.initState();
    _selectId = null;
    _fetchMovie();
  }

  Future<void> _fetchMovie() async {
    await listViewModel.fetchMovieList();
  }

  @override
  void didChangeDependencies() {
    _selectId = null;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return InheritedSelector(
            id: _selectId =
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? null
                    : _selectId,
            child: MoviesScaffoldWidget(
                moviesWidget: Row(
              children: [
                Expanded(
                  child: MoviesListViewModelWidget(
                    idCallback: (int? id) {
                      orientation == Orientation.portrait
                          ? _onClickPortrait(id, context)
                          : _onClickLandscape(id);
                    },
                    isHighlited: orientation == Orientation.landscape,
                  ),
                ),
                if (orientation == Orientation.landscape)
                  Expanded(flex: 2, child: DetailsVMWidget(id: _selectId))
              ],
            )));
      },
    );
  }

  void _onClickLandscape(int? id) {
    setState(() {
      _selectId = id;
    });
  }

  void _onClickPortrait(int? id, BuildContext context) async {
    int _movieFromDetails = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsViewModelPage(id: id)),
    );
    setState(() {
      _selectId = _movieFromDetails;
    });
    // AppInstance.detailViewModel.fetchMovieDetails(id);
  }
}
