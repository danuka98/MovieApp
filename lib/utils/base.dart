class Base{

  static String baseTestURL = "http://192.168.8.159:3000/";

  static String baseURL = baseTestURL;

  static String getMovieByID = baseURL + "movieDetails/getMoviesByID";
  static String getMovies = baseURL + "movieDetails/getAllMovies";
  static String addFavorite = baseURL + "movieDetails/addFavorite";
  static String getFavorite = baseURL + "movieDetails/getFavoriteMovie";
  static String getHome = baseURL + "movieDetails/getHome";
}