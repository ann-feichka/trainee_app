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
  final DetailsViewModel detailViewModel = AppInstance.detailViewModel;
  final MoviesViewModel listViewModel = AppInstance.listViewModel;
  int? _selectId;

  @override
  void initState() {
    super.initState();
    _fetchMovie();
  }

  Future<void> _fetchMovie() async {
    await listViewModel.fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedSelector(
      id: _selectId,
      child: MoviesScaffoldWidget(
          moviesWidget: OrientationBuilder(builder: (context, orientation) {
        return Row(
          children: [
            Container(
                width: orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.width / 3
                    : MediaQuery.of(context).size.width,
                child: MoviesListViewModelWidget(
                  idCallback: (int id) {
                    setState(() {
                      _selectId = id;
                    });
                    orientation == Orientation.portrait
                        ? _onClickPortrait(id, context)
                        : _onClickLandscape(id);
                  },
                  isHighlited: orientation == Orientation.landscape,
                )),
            orientation == Orientation.landscape
                ? Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: DetailsVMWidget(
                      id: _selectId,
                    ))
                : Container()
          ],
        );
      })),
    );
  }

  void _onClickLandscape(int id) {
    // setState(() {
    //   if (_selectId != id) {
    //     _selectId = id;
    //   }
    // });
  }
}

void _onClickPortrait(int id, BuildContext context) {
  Navigator.of(context)
      .pushNamed(DetailsViewModelPage.detailsPageViewModelRoute, arguments: id);
  // AppInstance.detailViewModel.fetchMovieDetails(id);
}
