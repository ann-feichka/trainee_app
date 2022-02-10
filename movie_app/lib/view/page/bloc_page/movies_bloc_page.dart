import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/details_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/movie_list_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/details_bloc_page.dart';

class MoviesBlocPage extends StatefulWidget {
  const MoviesBlocPage({Key? key}) : super(key: key);
  static const String moviesPageBlocRoute = "/movies_bloc";

  @override
  State<MoviesBlocPage> createState() => _MoviesBlocPageState();
}

class _MoviesBlocPageState extends State<MoviesBlocPage> {
  int? _selectId;
  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    context.read<MoviesListBloc>()..add(MovieListFetched());
  }

  // @override
  // void didChangeDependencies() {
  //   _selectId = null;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return InheritedSelector(
      id: _selectId,
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.moviesPageTittle),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return Row(
            children: <Widget>[
              Container(
                width: orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.width / 3
                    : MediaQuery.of(context).size.width,
                child: MovieListBlocBuilder(
                  isHighlited: orientation == Orientation.landscape,
                  idCallback: (int id) {
                    orientation == Orientation.portrait
                        ? _onClickPortrait(id, context)
                        : _onClickLandscape(id);
                  },
                ),
              ),
              orientation == Orientation.landscape
                  ? Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: DetailsBlocBuilder(
                        isUpdate: isUpdate,
                        id: _selectId,
                      ),
                    )
                  : Container(),
            ],
          );
        }),
      ),
    );
  }

  void _onClickPortrait(int id, BuildContext context) {
    setState(() {
      _selectId = id;
    });
    Navigator.of(context)
        .pushNamed(DetailsBlocPage.detailsPageBlocRoute, arguments: id);
  }

  void _onClickLandscape(int id) {
    setState(() {
      if (_selectId != id) {
        _selectId = id;
      }
    });
  }
}
