import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/movies_bloc_page.dart';
import 'package:movie_app/view/page/view_model_page/movies_view_model_page.dart';
import 'package:movie_app/view/widget/card/homepage_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String homePageRoute = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.appName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                    child: HomepageCard(
                  onBlocPressed: () {
                    Navigator.of(context)
                        .pushNamed(MoviesBlocPage.moviesPageBlocRoute);
                  },
                  onMVVMPressed: () {
                    Navigator.of(context).pushNamed(
                        MoviesViewModelPage.moviesPageViewModelRoute);
                  },
                )),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
