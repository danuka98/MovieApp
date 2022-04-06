import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/model/movie_details.dart';
import 'package:movieapp/utils/base.dart';
import 'package:http/http.dart' as http;


class MovieService{

  static getMovie(String id) async{
    String url = Base.getMovieByID + "/$id";

    print("url>>>>$url");
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      );
      print(response.body);
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        MovieDetails detailsClass = MovieDetails.fromJson(responseBody);
        print("======================Works=============================");
        return detailsClass;
      }
    } catch (e) {
      print("=================throwing Exception error==================");
      print("Error: $e");
      throw Exception("Error On server");
    }
    }
}