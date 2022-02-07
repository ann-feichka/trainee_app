import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/bloc_builder/details_bloc_builder.dart';
import 'package:movie_app/view/page/bloc_page/widget/landscape_bloc_page_widget.dart';

class DetailsBlocPage extends StatefulWidget {
  final int? id;

  const DetailsBlocPage({Key? key, required this.id}) : super(key: key);
  static const String detailsPageBlocRoute = "/details_bloc";

  @override
  State<DetailsBlocPage> createState() => _DetailsBlocPageState();
}

class _DetailsBlocPageState extends State<DetailsBlocPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>()..add(MovieDetailFetchEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Scaffold(
                appBar: AppBar(
                  title: Text(StringConstants.detailsPageTittle),
                  centerTitle: true,
                ),
                body: DetailsBlocBuilder(
                  isLandscape: false,
                ))
            : LandscapeBlocPageWidget(
                isFromMoviesPage: false,
              );
      },
    );
  }
}
