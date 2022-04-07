class Search {
  bool? success;
  List<MovieDetails>? movieDetails;
  String? message;

  Search({this.success, this.movieDetails, this.message});

  Search.fromJson(Map<String, dynamic> json) {
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
  double? rate;
  int? movieYear;
  String? movieTrailerLink;
  String? movieDescription;
  String? movieDirector;
  List<MovieCategories>? movieCategories;
  int? iV;

  MovieDetails(
      {this.sId,
        this.movieID,
        this.coverImage,
        this.movieName,
        this.isFavorite,
        this.rate,
        this.movieYear,
        this.movieTrailerLink,
        this.movieDescription,
        this.movieDirector,
        this.movieCategories,
        this.iV});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    movieID = json['movieID'];
    coverImage = json['coverImage'];
    movieName = json['movieName'];
    isFavorite = json['isFavorite'];
    rate = json['rate'];
    movieYear = json['movieYear'];
    movieTrailerLink = json['movieTrailerLink'];
    movieDescription = json['movieDescription'];
    movieDirector = json['movieDirector'];
    if (json['movieCategories'] != null) {
      movieCategories = <MovieCategories>[];
      json['movieCategories'].forEach((v) {
        movieCategories!.add(new MovieCategories.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['movieID'] = this.movieID;
    data['coverImage'] = this.coverImage;
    data['movieName'] = this.movieName;
    data['isFavorite'] = this.isFavorite;
    data['rate'] = this.rate;
    data['movieYear'] = this.movieYear;
    data['movieTrailerLink'] = this.movieTrailerLink;
    data['movieDescription'] = this.movieDescription;
    data['movieDirector'] = this.movieDirector;
    if (this.movieCategories != null) {
      data['movieCategories'] =
          this.movieCategories!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class MovieCategories {
  String? categoryID;
  String? categoryType;
  String? catogoryName;
  String? sId;

  MovieCategories(
      {this.categoryID, this.categoryType, this.catogoryName, this.sId});

  MovieCategories.fromJson(Map<String, dynamic> json) {
    categoryID = json['categoryID'];
    categoryType = json['categoryType'];
    catogoryName = json['catogoryName'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryID'] = this.categoryID;
    data['categoryType'] = this.categoryType;
    data['catogoryName'] = this.catogoryName;
    data['_id'] = this.sId;
    return data;
  }
}
