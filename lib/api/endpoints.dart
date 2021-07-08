import '../constants/constants.dart';

class Endpoints {
  static String popularitybyear(int page, int year) {
    return '$TMDB_API_BASE_URL'
        '/discover/movie?api_key='
        '$TMDB_API_KEY'
        '&language=en-US&sort_by=popularity'
        '.desc&&include_video=false&page'
        '=$page&primary_release_year=$year';
  }

  static String getCreditsUrl(int id) {
    return '$TMDB_API_BASE_URL' + '/movie/$id/credits?api_key=$TMDB_API_KEY';
  }

  static String movieDetailsUrl(int movieId) {
    return '$TMDB_API_BASE_URL/movie/$movieId?api_key=$TMDB_API_KEY&append_to_response=credits,'
        'images';
  }
}
