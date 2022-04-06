import 'package:flutter/material.dart';
import 'package:movieapp/model/movie_details.dart';
import 'package:movieapp/service/movie_service.dart';

class MovieProvider with ChangeNotifier{
  MovieDetails movieDetails = MovieDetails();
  bool isLoading = false;

  getMovieDetails(String id) async{
    isLoading = true;
    movieDetails = await MovieService.getMovie(id);
    isLoading = false;
    notifyListeners();
  }
}