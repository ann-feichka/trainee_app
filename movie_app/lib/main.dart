import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/route_generator.dart';
import 'package:movie_app/simple_bloc_observer.dart';
import 'package:movie_app/view/page/home_page.dart';

import 'bloc/movies_bloc/movies_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MoviesListBloc>(create: (_) => MoviesListBloc()),
          // BlocProvider<MovieDetailBloc>(create: (_) => MovieDetailBloc())
        ],
        child: MaterialApp(
          title: 'Movies App',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          onGenerateRoute: RouteGenerator.onGenerateRoute,
          onUnknownRoute: RouteGenerator.onUnknownRoute,
          home: HomePage(),
        ));
  }
}
