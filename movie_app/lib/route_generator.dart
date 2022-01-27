import 'package:flutter/material.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/page/details_page.dart';
import 'package:movie_app/view/page/home_page.dart';
import 'package:movie_app/view/page/movies_page.dart';

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

      case moviesPage:
        return MaterialPageRoute(
          builder: (_) => MoviesPage(
            isBloc: arguments as bool,
          ),
        );

      case detailsPage:
        return MaterialPageRoute(
          builder: (_) => MovieDetailsPage(
            arguments: arguments as MovieDetailsArguments,
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
