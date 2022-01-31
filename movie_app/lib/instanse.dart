import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/view_model/view_model.dart';

class AppModule {
  static DetailsViewModel detailViewModel = DetailsViewModel();
  static MoviesViewModel listViewModel = MoviesViewModel();
  static MovieRepository movieRepository = MovieRepository();
}
