class Favorite {
  bool? success;
  List<MovieDetails>? movieDetails;
  String? message;

  Favorite({this.success, this.movieDetails, this.message});

  Favorite.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['movieDetails'] != null) {
      movieDetails = <MovieDetails>[];
      json['movieDetails'].forEach((v) {
        movieDetails!.add(new MovieDetails.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.movieDetails != null) {
      data['movieDetails'] = this.movieDetails!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class MovieDetails {
  String? sId;
  String? movieID;
  String? coverImage;
  String? movieName;
  int? isFavorite;
  //List<Null>? movieCategories;
  int? iV;

  MovieDetails(
      {this.sId,
        this.movieID,
        this.coverImage,
        this.movieName,
        this.isFavorite,
        //this.movieCategories,
        this.iV});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    movieID = json['movieID'];
    coverImage = json['coverImage'];
    movieName = json['movieName'];
    isFavorite = json['isFavorite'];
    // if (json['movieCategories'] != null) {
    //   movieCategories = <Null>[];
    //   json['movieCategories'].forEach((v) {
    //     movieCategories!.add(new Null.fromJson(v));
    //   });
    // }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['movieID'] = this.movieID;
    data['coverImage'] = this.coverImage;
    data['movieName'] = this.movieName;
    data['isFavorite'] = this.isFavorite;
    // if (this.movieCategories != null) {
    //   data['movieCategories'] =
    //       this.movieCategories!.map((v) => v!.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}
