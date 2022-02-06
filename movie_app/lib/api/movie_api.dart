abstract class MovieApi {
  String baseUrl = 'api.themoviedb.org';
  static String baseImageUrl = 'https://image.tmdb.org/t/p/';
  Map<String, String> baseHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Map<String, String> baseQueryParameters = {
    'api_key': '4c4fd1fdccfb45494feb62b21a3436f0'
  };

  Future<dynamic> fetchPopularMovie();

  Future<dynamic> fetchMovieDetails({required int id});
}
