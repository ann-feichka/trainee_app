import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/home_page.dart';

class LandscapeScaffoldWidget extends StatelessWidget {
  final Widget moviesWidget;
  final Widget detailsWidget;
  const LandscapeScaffoldWidget(
      {Key? key, required this.moviesWidget, required this.detailsWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.landscapePageTittle),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).popAndPushNamed(HomePage.homePageRoute),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.longestSide / 3,
                child: moviesWidget),
            Container(
                width: MediaQuery.of(context).size.longestSide / 3 * 2,
                child: detailsWidget),
          ],
        ));
  }
}
