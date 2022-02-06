import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/api/movie_api_impl.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/view_model/view_model.dart';

class AppInstance {
  static DetailsViewModel detailViewModel = DetailsViewModel();
  static MoviesViewModel listViewModel = MoviesViewModel();
  static MovieRepository movieRepository = MovieRepository();
  static MovieApi movieApi = MovieApiImpl();
}
