import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/bloc_page/details_bloc_page.dart';
import 'package:movie_app/view/page/bloc_page/movies_bloc_page.dart';
import 'package:movie_app/view/page/home_page.dart';
import 'package:movie_app/view/page/view_model_page/details_view_model_page.dart';
import 'package:movie_app/view/page/view_model_page/movies_view_model_page.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Object? arguments = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case moviesPageBloc:
        return MaterialPageRoute(builder: (_) => MoviesBlocPage());

      case detailsPageBloc:
        return MaterialPageRoute(
          builder: (_) => DetailsBlocPage(
            id: arguments as int,
          ),
        );

      case moviesPageViewModel:
        return MaterialPageRoute(builder: (_) => MoviesViewModelPage());

      case detailsPageViewModel:
        return MaterialPageRoute(
          builder: (_) => DetailsViewModelPage(
            id: arguments as int,
          ),
        );
      default:
        return RouteGenerator.onUnknownRoute(settings);
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants().pageNotFound),
        ),
      );
    });
  }
}
