import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/view/widget/details_page_body_widget.dart';
import 'package:movie_app/view/widget/no_details_widget.dart';

class DetailsBlocBuilder extends StatefulWidget {
  final int? id;
  const DetailsBlocBuilder({Key? key, this.id}) : super(key: key);

  @override
  State<DetailsBlocBuilder> createState() => _DetailsBlocBuilderState();
}

class _DetailsBlocBuilderState extends State<DetailsBlocBuilder> {
  int? selectId;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieDetailBloc>(context)
      ..add(MovieDetailFetchEvent(widget.id));
  }

  @override
  void didChangeDependencies() {
    selectId = InheritedSelector.of(context);
    BlocProvider.of<MovieDetailBloc>(context)
      ..add(MovieDetailFetchEvent(selectId));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieDetailBloc, MovieDetailsState>(
      listener: (context, state) {
        if (state is MovieDetailsFailedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message!)));
        }
      },
      child: BlocBuilder<MovieDetailBloc, MovieDetailsState>(
          builder: (context, state) {
        if (state is MovieDetailsSuccessState) {
          return DetailsPageBodyWidget(movie: state.movie);
        }
        if (state is MovieDetailsInitialState) {
          return NoDetailsWidget();
        }
        if (state is MovieDetailsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: NoDetailsWidget(),
        );
      }),
    );
  }
}
