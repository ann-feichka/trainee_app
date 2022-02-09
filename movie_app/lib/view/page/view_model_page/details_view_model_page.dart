import 'package:flutter/material.dart';
import 'package:movie_app/app_instance.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/view_model_page/widget/details_v_m_widget.dart';
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
    // _fetchDetails();
  }

  // Future<void> _fetchDetails() async {
  //   await detailViewModel.fetchMovieDetails(widget.id);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.detailsPageTittle),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          orientation == Orientation.landscape
              ? Navigator.of(context).pop()
              : null;
          return DetailsVMWidget(
            id: widget.id,
          );
        }));
  }
}
