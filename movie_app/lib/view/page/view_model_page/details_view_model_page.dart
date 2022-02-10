import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/view_model_page/widget/details_v_m_widget.dart';

class DetailsViewModelPage extends StatefulWidget {
  final int? id;
  static const String detailsPageViewModelRoute = "/details_view_model";
  const DetailsViewModelPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsViewModelPageState createState() => _DetailsViewModelPageState();
}

class _DetailsViewModelPageState extends State<DetailsViewModelPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.detailsPageTittle),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            Navigator.of(context).pop();
          }
          return DetailsVMWidget(
            id: widget.id,
          );
        }));
  }
}
