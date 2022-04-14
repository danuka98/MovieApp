class GetHome {
  bool? success;
  MovieCategories? movieCategories;
  MovieCategoriesLength? movieCategoriesLength;
  String? message;

  GetHome(
      {this.success,
        this.movieCategories,
        this.movieCategoriesLength,
        this.message});

  GetHome.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    movieCategories = json['movieCategories'] != null
        ? new MovieCategories.fromJson(json['movieCategories'])
        : null;
    movieCategoriesLength = json['movieCategoriesLength'] != null
        ? new MovieCategoriesLength.fromJson(json['movieCategoriesLength'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.movieCategories != null) {
      data['movieCategories'] = this.movieCategories!.toJson();
    }
    if (this.movieCategoriesLength != null) {
      data['movieCategoriesLength'] = this.movieCategoriesLength!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class MovieCategories {
  List<Action>? action;
  List<Comedy>? comedy;
  List<Drama>? drama;
  List<Horror>? horror;
  List<Romance>? romance;
  List<SlideShow>? slideShow;

  MovieCategories(
      {this.action,
        this.comedy,
        this.drama,
        this.horror,
        this.romance,
        this.slideShow});

  MovieCategories.fromJson(Map<String, dynamic> json) {
    if (json['Action'] != null) {
      action = <Action>[];
      json['Action'].forEach((v) {
        action!.add(new Action.fromJson(v));
      });
    }
    if (json['Comedy'] != null) {
      comedy = <Comedy>[];
      json['Comedy'].forEach((v) {
        comedy!.add(new Comedy.fromJson(v));
      });
    }
    if (json['Drama'] != null) {
      drama = <Drama>[];
      json['Drama'].forEach((v) {
        drama!.add(new Drama.fromJson(v));
      });
    }
    if (json['Horror'] != null) {
      horror = <Horror>[];
      json['Horror'].forEach((v) {
        horror!.add(new Horror.fromJson(v));
      });
    }
    if (json['Romance'] != null) {
      romance = <Romance>[];
      json['Romance'].forEach((v) {
        romance!.add(new Romance.fromJson(v));
      });
    }
    if (json['slideShow'] != null) {
      slideShow = <SlideShow>[];
      json['slideShow'].forEach((v) {
        slideShow!.add(new SlideShow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.action != null) {
      data['Action'] = this.action!.map((v) => v.toJson()).toList();
    }
    if (this.comedy != null) {
      data['Comedy'] = this.comedy!.map((v) => v.toJson()).toList();
    }
    if (this.drama != null) {
      data['Drama'] = this.drama!.map((v) => v.toJson()).toList();
    }
    if (this.horror != null) {
      data['Horror'] = this.horror!.map((v) => v.toJson()).toList();
    }
    if (this.romance != null) {
      data['Romance'] = this.romance!.map((v) => v.toJson()).toList();
    }
    if (this.slideShow != null) {
      data['slideShow'] = this.slideShow!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Action {
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
  //List<MovieCategories>? movieCategories;
  int? iV;

  Action(
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
        //this.movieCategories,
        this.iV});

  Action.fromJson(Map<String, dynamic> json) {
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
    // if (json['movieCategories'] != null) {
    //   movieCategories = <MovieCategories>[];
    //   json['movieCategories'].forEach((v) {
    //     movieCategories!.add(new MovieCategories.fromJson(v));
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
    data['rate'] = this.rate;
    data['movieYear'] = this.movieYear;
    data['movieTrailerLink'] = this.movieTrailerLink;
    data['movieDescription'] = this.movieDescription;
    data['movieDirector'] = this.movieDirector;
    // if (this.movieCategories != null) {
    //   data['movieCategories'] =
    //       this.movieCategories!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}

class Comedy {
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
  //List<MovieCategories>? movieCategories;
  int? iV;

  Comedy(
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
        //this.movieCategories,
        this.iV});

  Comedy.fromJson(Map<String, dynamic> json) {
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
    // if (json['movieCategories'] != null) {
    //   movieCategories = <MovieCategories>[];
    //   json['movieCategories'].forEach((v) {
    //     movieCategories!.add(new MovieCategories.fromJson(v));
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
    data['rate'] = this.rate;
    data['movieYear'] = this.movieYear;
    data['movieTrailerLink'] = this.movieTrailerLink;
    data['movieDescription'] = this.movieDescription;
    data['movieDirector'] = this.movieDirector;
    // if (this.movieCategories != null) {
    //   data['movieCategories'] =
    //       this.movieCategories!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}

class Drama {
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
  //List<MovieCategories>? movieCategories;
  int? iV;

  Drama(
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
        //this.movieCategories,
        this.iV});

  Drama.fromJson(Map<String, dynamic> json) {
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
    // if (json['movieCategories'] != null) {
    //   movieCategories = <MovieCategories>[];
    //   json['movieCategories'].forEach((v) {
    //     movieCategories!.add(new MovieCategories.fromJson(v));
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
    data['rate'] = this.rate;
    data['movieYear'] = this.movieYear;
    data['movieTrailerLink'] = this.movieTrailerLink;
    data['movieDescription'] = this.movieDescription;
    data['movieDirector'] = this.movieDirector;
    // if (this.movieCategories != null) {
    //   data['movieCategories'] =
    //       this.movieCategories!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}

class Horror {
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
  //List<MovieCategories>? movieCategories;
  int? iV;

  Horror(
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
        //this.movieCategories,
        this.iV});

  Horror.fromJson(Map<String, dynamic> json) {
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
    // if (json['movieCategories'] != null) {
    //   movieCategories = <MovieCategories>[];
    //   json['movieCategories'].forEach((v) {
    //     movieCategories!.add(new MovieCategories.fromJson(v));
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
    data['rate'] = this.rate;
    data['movieYear'] = this.movieYear;
    data['movieTrailerLink'] = this.movieTrailerLink;
    data['movieDescription'] = this.movieDescription;
    data['movieDirector'] = this.movieDirector;
    // if (this.movieCategories != null) {
    //   data['movieCategories'] =
    //       this.movieCategories!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}

class Romance {
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
  //List<MovieCategories>? movieCategories;
  int? iV;

  Romance(
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
        //this.movieCategories,
        this.iV});

  Romance.fromJson(Map<String, dynamic> json) {
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
    // if (json['movieCategories'] != null) {
    //   movieCategories = <MovieCategories>[];
    //   json['movieCategories'].forEach((v) {
    //     movieCategories!.add(new MovieCategories.fromJson(v));
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
    data['rate'] = this.rate;
    data['movieYear'] = this.movieYear;
    data['movieTrailerLink'] = this.movieTrailerLink;
    data['movieDescription'] = this.movieDescription;
    data['movieDirector'] = this.movieDirector;
    // if (this.movieCategories != null) {
    //   data['movieCategories'] =
    //       this.movieCategories!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}

// class MovieCategories {
//   String? categoryID;
//   String? categoryType;
//   String? catogoryName;
//   String? sId;
//
//   MovieCategories(
//       {this.categoryID, this.categoryType, this.catogoryName, this.sId});
//
//   MovieCategories.fromJson(Map<String, dynamic> json) {
//     categoryID = json['categoryID'];
//     categoryType = json['categoryType'];
//     catogoryName = json['catogoryName'];
//     sId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['categoryID'] = this.categoryID;
//     data['categoryType'] = this.categoryType;
//     data['catogoryName'] = this.catogoryName;
//     data['_id'] = this.sId;
//     return data;
//   }
// }

class SlideShow {
  SlideShowMovie? slideShowMovie;
  String? sId;
  int? iV;

  SlideShow({this.slideShowMovie, this.sId, this.iV});

  SlideShow.fromJson(Map<String, dynamic> json) {
    slideShowMovie = json['slideShowMovie'] != null
        ? new SlideShowMovie.fromJson(json['slideShowMovie'])
        : null;
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slideShowMovie != null) {
      data['slideShowMovie'] = this.slideShowMovie!.toJson();
    }
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class SlideShowMovie {
  String? movieID;
  String? image;

  SlideShowMovie({this.movieID, this.image});

  SlideShowMovie.fromJson(Map<String, dynamic> json) {
    movieID = json['movieID'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieID'] = this.movieID;
    data['image'] = this.image;
    return data;
  }
}

class MovieCategoriesLength {
  int? action;
  int? comedy;
  int? drama;
  int? horror;
  int? romance;
  int? slideShow;

  MovieCategoriesLength(
      {this.action,
        this.comedy,
        this.drama,
        this.horror,
        this.romance,
        this.slideShow});

  MovieCategoriesLength.fromJson(Map<String, dynamic> json) {
    action = json['Action'];
    comedy = json['Comedy'];
    drama = json['Drama'];
    horror = json['Horror'];
    romance = json['Romance'];
    slideShow = json['slideShow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Action'] = this.action;
    data['Comedy'] = this.comedy;
    data['Drama'] = this.drama;
    data['Horror'] = this.horror;
    data['Romance'] = this.romance;
    data['slideShow'] = this.slideShow;
    return data;
  }
}
