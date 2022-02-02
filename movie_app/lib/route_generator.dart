import 'package:flutter/material.dart';
import 'package:movie_app/view/page/bloc_page/details_bloc_page.dart';
import 'package:movie_app/view/page/bloc_page/movies_bloc_page.dart';
import 'package:movie_app/view/page/home_page.dart';
import 'package:movie_app/view/page/view_model_page/details_view_model_page.dart';
import 'package:movie_app/view/page/view_model_page/movies_view_model_page.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Object? arguments = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case HomePage.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case MoviesBlocPage.moviesPageBlocRoute:
        return MaterialPageRoute(builder: (_) => MoviesBlocPage());

      case DetailsBlocPage.detailsPageBlocRoute:
        return MaterialPageRoute(
          builder: (_) => DetailsBlocPage(
            id: arguments as int,
          ),
        );

      case MoviesViewModelPage.moviesPageViewModelRoute:
        return MaterialPageRoute(builder: (_) => MoviesViewModelPage());

      case DetailsViewModelPage.detailsPageViewModelRoute:
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
    return null;
  }
}
