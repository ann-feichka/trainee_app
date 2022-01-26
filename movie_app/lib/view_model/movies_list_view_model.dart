import 'package:flutter/foundation.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MoviesListViewModel with ChangeNotifier {
  List<Movie>? _movies;
  final _repository = MovieRepository();

  List<Movie>? get movies {
    return _movies;
  }

  getMovieList() async {
    _movies = _repository.fetchMoviesList();
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
