import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/details_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/movie_list_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/details_bloc_page.dart';
import 'package:movie_app/view/widget/movies_scaffold_widget.dart';

class MoviesBlocPage extends StatefulWidget {
  const MoviesBlocPage({Key? key}) : super(key: key);
  static const String moviesPageBlocRoute = "/movies_bloc";

  @override
  State<MoviesBlocPage> createState() => _MoviesBlocPageState();
}

class _MoviesBlocPageState extends State<MoviesBlocPage> {
  int? _selectId;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesListBloc>(context)..add(MovieListFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailBloc>(
      create: (_) => MovieDetailBloc(),
      child: InheritedSelector(
        id: _selectId =
            MediaQuery.of(context).orientation == Orientation.portrait
                ? null
                : _selectId,
        child: MoviesScaffoldWidget(
          moviesWidget: OrientationBuilder(builder: (context, orientation) {
            bool isPortrait = orientation == Orientation.portrait;
            return Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: MovieListBlocBuilder(
                    isHighlited: !isPortrait,
                    idCallback: (int? id) {
                      isPortrait
                          ? _onClickPortrait(id, context)
                          : setState(() {
                              _selectId = id;
                            });
                    },
                  ),
                ),
                if (!isPortrait)
                  Expanded(
                    flex: 2,
                    child: DetailsBlocBuilder(
                      id: _selectId,
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Future<void> _onClickPortrait(int? id, BuildContext context) async {
    int _movieFromDetails = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsBlocPage(id: id)),
    );
    setState(() {
      _selectId = _movieFromDetails;
    });
  }
}
