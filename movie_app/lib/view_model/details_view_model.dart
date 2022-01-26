
import 'package:flutter/foundation.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';

class DetailsViewModel with ChangeNotifier {
  Movie? _movie;
  final _repository = MovieRepository();

  Movie? get movie {
    return _movie;
  }

  getMovieForDetail(int? id) async {
    if (id ==null){
      _movie= null;
      notifyListeners();
    }else{
      _movie = _repository.getMovie(id);
      notifyListeners();
    }
  }
}
