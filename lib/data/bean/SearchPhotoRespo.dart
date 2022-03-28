/// total : 10000
/// total_pages : 10000
/// results : [{"id":"I6K5ZSAfJDk","created_at":"2018-09-04T08:14:50-04:00","updated_at":"2021-06-05T17:04:22-04:00","promoted_at":"2018-09-04T11:50:43-04:00","width":3648,"height":5472,"color":"#f3f3f3","blur_hash":"L~Lgnct7oeWC~qfljaoLx]WBWCj[","description":"Shine on me","alt_description":"woman holding her hair","urls":{"raw":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1","full":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=85","regular":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=1080","small":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=400","thumb":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=200"},"links":{"self":"https://api.unsplash.com/photos/I6K5ZSAfJDk","html":"https://unsplash.com/photos/I6K5ZSAfJDk","download":"https://unsplash.com/photos/I6K5ZSAfJDk/download","download_location":"https://api.unsplash.com/photos/I6K5ZSAfJDk/download?ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg"},"likes":98,"liked_by_user":false,"user":{"id":"0gIth04Zc8M","updated_at":"2021-06-05T03:52:58-04:00","username":"nyanastoica","name":"Nyana Stoica","first_name":"Nyana","last_name":"Stoica","portfolio_url":"https://www.facebook.com/nyanastoicaphotos/","bio":"Instagram: @nyanastoicaphotos","location":"Ploiesti, Romania","user_links":{"self":"https://api.unsplash.com/users/nyanastoica","html":"https://unsplash.com/@nyanastoica","photos":"https://api.unsplash.com/users/nyanastoica/photos","likes":"https://api.unsplash.com/users/nyanastoica/likes","portfolio":"https://api.unsplash.com/users/nyanastoica/portfolio","following":"https://api.unsplash.com/users/nyanastoica/following","followers":"https://api.unsplash.com/users/nyanastoica/followers"},"profile_image":{"small":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32","medium":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64","large":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},"instagram_username":"nyanastoicaphotos","total_collections":3,"total_likes":25,"total_photos":33,"accepted_tos":true,"for_hire":false}}]

class SearchPhotoRespo {
  int? _total;
  int? _totalPages;
  List<Results>? _results;

  int? get total => _total;
  int? get totalPages => _totalPages;
  List<Results>? get results => _results;

  SearchPhotoRespo({
      int? total, 
      int? totalPages, 
      List<Results>? results}){
    _total = total;
    _totalPages = totalPages;
    _results = results;
}

  SearchPhotoRespo.fromJson(Map<String, dynamic> json) {
    _total = json["total"];
    _totalPages = json["total_pages"];
    if (json["results"] != null) {
      _results = [];
      json["results"].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["total"] = _total;
    map["total_pages"] = _totalPages;
    if (_results != null) {
      map["results"] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "I6K5ZSAfJDk"
/// created_at : "2018-09-04T08:14:50-04:00"
/// updated_at : "2021-06-05T17:04:22-04:00"
/// promoted_at : "2018-09-04T11:50:43-04:00"
/// width : 3648
/// height : 5472
/// color : "#f3f3f3"
/// blur_hash : "L~Lgnct7oeWC~qfljaoLx]WBWCj["
/// description : "Shine on me"
/// alt_description : "woman holding her hair"
/// urls : {"raw":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1","full":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=85","regular":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=1080","small":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=400","thumb":"https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=200"}
/// links : {"self":"https://api.unsplash.com/photos/I6K5ZSAfJDk","html":"https://unsplash.com/photos/I6K5ZSAfJDk","download":"https://unsplash.com/photos/I6K5ZSAfJDk/download","download_location":"https://api.unsplash.com/photos/I6K5ZSAfJDk/download?ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg"}
/// likes : 98
/// liked_by_user : false
/// user : {"id":"0gIth04Zc8M","updated_at":"2021-06-05T03:52:58-04:00","username":"nyanastoica","name":"Nyana Stoica","first_name":"Nyana","last_name":"Stoica","portfolio_url":"https://www.facebook.com/nyanastoicaphotos/","bio":"Instagram: @nyanastoicaphotos","location":"Ploiesti, Romania","user_links":{"self":"https://api.unsplash.com/users/nyanastoica","html":"https://unsplash.com/@nyanastoica","photos":"https://api.unsplash.com/users/nyanastoica/photos","likes":"https://api.unsplash.com/users/nyanastoica/likes","portfolio":"https://api.unsplash.com/users/nyanastoica/portfolio","following":"https://api.unsplash.com/users/nyanastoica/following","followers":"https://api.unsplash.com/users/nyanastoica/followers"},"profile_image":{"small":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32","medium":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64","large":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},"instagram_username":"nyanastoicaphotos","total_collections":3,"total_likes":25,"total_photos":33,"accepted_tos":true,"for_hire":false}

class Results {
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _promotedAt;
  int? _width;
  int? _height;
  String? _color;
  String? _blurHash;
  String? _description;
  String? _altDescription;
  Urls? _urls;
  Links? _links;
  int? _likes;
  bool? _likedByUser;
  User? _user;

  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get promotedAt => _promotedAt;
  int? get width => _width;
  int? get height => _height;
  String? get color => _color;
  String? get blurHash => _blurHash;
  String? get description => _description;
  String? get altDescription => _altDescription;
  Urls? get urls => _urls;
  Links? get links => _links;
  int? get likes => _likes;
  bool? get likedByUser => _likedByUser;
  User? get user => _user;

  Results({
      String? id, 
      String? createdAt,
      String? updatedAt,
      String? promotedAt,
      int? width,
      int? height,
      String? color,
      String? blurHash,
      String? description,
      String? altDescription,
      Urls? urls,
      Links? links,
      int? likes,
      bool? likedByUser,
      User? user
  }){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _promotedAt = promotedAt;
    _width = width;
    _height = height;
    _color = color;
    _blurHash = blurHash;
    _description = description;
    _altDescription = altDescription;
    _urls = urls;
    _links = links;
    _likes = likes;
    _likedByUser = likedByUser;
    _user = user;
}

  Results.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _promotedAt = json["promoted_at"];
    _width = json["width"];
    _height = json["height"];
    _color = json["color"];
    _blurHash = json["blur_hash"];
    _description = json["description"];
    _altDescription = json["alt_description"];
    _urls = json["urls"] != null ? Urls.fromJson(json["urls"]) : null;
    _links = json["links"] != null ? Links.fromJson(json["links"]) : null;
    _likes = json["likes"];
    _likedByUser = json["liked_by_user"];
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["promoted_at"] = _promotedAt;
    map["width"] = _width;
    map["height"] = _height;
    map["color"] = _color;
    map["blur_hash"] = _blurHash;
    map["description"] = _description;
    map["alt_description"] = _altDescription;
    if (_urls != null) {
      map["urls"] = _urls?.toJson();
    }
    if (_links != null) {
      map["links"] = _links?.toJson();
    }
    map["likes"] = _likes;
    map["liked_by_user"] = _likedByUser;
    if (_user != null) {
      map["user"] = _user?.toJson();
    }
    return map;
  }

}

/// id : "0gIth04Zc8M"
/// updated_at : "2021-06-05T03:52:58-04:00"
/// username : "nyanastoica"
/// name : "Nyana Stoica"
/// first_name : "Nyana"
/// last_name : "Stoica"
/// portfolio_url : "https://www.facebook.com/nyanastoicaphotos/"
/// bio : "Instagram: @nyanastoicaphotos"
/// location : "Ploiesti, Romania"
/// user_links : {"self":"https://api.unsplash.com/users/nyanastoica","html":"https://unsplash.com/@nyanastoica","photos":"https://api.unsplash.com/users/nyanastoica/photos","likes":"https://api.unsplash.com/users/nyanastoica/likes","portfolio":"https://api.unsplash.com/users/nyanastoica/portfolio","following":"https://api.unsplash.com/users/nyanastoica/following","followers":"https://api.unsplash.com/users/nyanastoica/followers"}
/// profile_image : {"small":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32","medium":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64","large":"https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"}
/// instagram_username : "nyanastoicaphotos"
/// total_collections : 3
/// total_likes : 25
/// total_photos : 33
/// accepted_tos : true
/// for_hire : false

class User {
  String? _id;
  String? _updatedAt;
  String? _username;
  String? _name;
  String? _firstName;
  String? _lastName;
  String? _portfolioUrl;
  String? _bio;
  String? _location;
  User_links? _userLinks;
  Profile_image? _profileImage;
  String? _instagramUsername;
  int? _totalCollections;
  int? _totalLikes;
  int? _totalPhotos;
  bool? _acceptedTos;
  bool? _forHire;

  String? get id => _id;
  String? get updatedAt => _updatedAt;
  String? get username => _username;
  String? get name => _name;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get portfolioUrl => _portfolioUrl;
  String? get bio => _bio;
  String? get location => _location;
  User_links? get userLinks => _userLinks;
  Profile_image? get profileImage => _profileImage;
  String? get instagramUsername => _instagramUsername;
  int? get totalCollections => _totalCollections;
  int? get totalLikes => _totalLikes;
  int? get totalPhotos => _totalPhotos;
  bool? get acceptedTos => _acceptedTos;
  bool? get forHire => _forHire;

  User({
      String? id, 
      String? updatedAt, 
      String? username, 
      String? name, 
      String? firstName, 
      String? lastName, 
      String? portfolioUrl, 
      String? bio, 
      String? location, 
      User_links? userLinks, 
      Profile_image? profileImage, 
      String? instagramUsername, 
      int? totalCollections, 
      int? totalLikes, 
      int? totalPhotos, 
      bool? acceptedTos, 
      bool? forHire}){
    _id = id;
    _updatedAt = updatedAt;
    _username = username;
    _name = name;
    _firstName = firstName;
    _lastName = lastName;
    _portfolioUrl = portfolioUrl;
    _bio = bio;
    _location = location;
    _userLinks = userLinks;
    _profileImage = profileImage;
    _instagramUsername = instagramUsername;
    _totalCollections = totalCollections;
    _totalLikes = totalLikes;
    _totalPhotos = totalPhotos;
    _acceptedTos = acceptedTos;
    _forHire = forHire;
}

  User.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _updatedAt = json["updated_at"];
    _username = json["username"];
    _name = json["name"];
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _portfolioUrl = json["portfolio_url"];
    _bio = json["bio"];
    _location = json["location"];
    _userLinks = json["links"] != null ? User_links.fromJson(json["links"]) : null;
    _profileImage = json["profile_image"] != null ? Profile_image.fromJson(json["profile_image"]) : null;
    _instagramUsername = json["instagram_username"];
    _totalCollections = json["total_collections"];
    _totalLikes = json["total_likes"];
    _totalPhotos = json["total_photos"];
    _acceptedTos = json["accepted_tos"];
    _forHire = json["for_hire"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["updated_at"] = _updatedAt;
    map["username"] = _username;
    map["name"] = _name;
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["portfolio_url"] = _portfolioUrl;
    map["bio"] = _bio;
    map["location"] = _location;
    if (_userLinks != null) {
      map["user_links"] = _userLinks?.toJson();
    }
    if (_profileImage != null) {
      map["profile_image"] = _profileImage?.toJson();
    }
    map["instagram_username"] = _instagramUsername;
    map["total_collections"] = _totalCollections;
    map["total_likes"] = _totalLikes;
    map["total_photos"] = _totalPhotos;
    map["accepted_tos"] = _acceptedTos;
    map["for_hire"] = _forHire;
    return map;
  }

}

/// small : "https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32"
/// medium : "https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64"
/// large : "https://images.unsplash.com/profile-1521530285776-b91d5eddd60a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"

class Profile_image {
  String? _small;
  String? _medium;
  String? _large;

  String? get small => _small;
  String? get medium => _medium;
  String? get large => _large;

  Profile_image({
      String? small, 
      String? medium, 
      String? large}){
    _small = small;
    _medium = medium;
    _large = large;
}

  Profile_image.fromJson(Map<String, dynamic> json) {
    _small = json["small"];
    _medium = json["medium"];
    _large = json["large"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["small"] = _small;
    map["medium"] = _medium;
    map["large"] = _large;
    return map;
  }

}

/// self : "https://api.unsplash.com/users/nyanastoica"
/// html : "https://unsplash.com/@nyanastoica"
/// photos : "https://api.unsplash.com/users/nyanastoica/photos"
/// likes : "https://api.unsplash.com/users/nyanastoica/likes"
/// portfolio : "https://api.unsplash.com/users/nyanastoica/portfolio"
/// following : "https://api.unsplash.com/users/nyanastoica/following"
/// followers : "https://api.unsplash.com/users/nyanastoica/followers"

class User_links {
  String? _self;
  String? _html;
  String? _photos;
  String? _likes;
  String? _portfolio;
  String? _following;
  String? _followers;

  String? get self => _self;
  String? get html => _html;
  String? get photos => _photos;
  String? get likes => _likes;
  String? get portfolio => _portfolio;
  String? get following => _following;
  String? get followers => _followers;

  User_links({
      String? self, 
      String? html, 
      String? photos, 
      String? likes, 
      String? portfolio, 
      String? following, 
      String? followers}){
    _self = self;
    _html = html;
    _photos = photos;
    _likes = likes;
    _portfolio = portfolio;
    _following = following;
    _followers = followers;
}

  User_links.fromJson(Map<String, dynamic> json) {
    _self = json["self"];
    _html = json["html"];
    _photos = json["photos"];
    _likes = json["likes"];
    _portfolio = json["portfolio"];
    _following = json["following"];
    _followers = json["followers"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["self"] = _self;
    map["html"] = _html;
    map["photos"] = _photos;
    map["likes"] = _likes;
    map["portfolio"] = _portfolio;
    map["following"] = _following;
    map["followers"] = _followers;
    return map;
  }

}

/// self : "https://api.unsplash.com/photos/I6K5ZSAfJDk"
/// html : "https://unsplash.com/photos/I6K5ZSAfJDk"
/// download : "https://unsplash.com/photos/I6K5ZSAfJDk/download"
/// download_location : "https://api.unsplash.com/photos/I6K5ZSAfJDk/download?ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg"

class Links {
  String? _self;
  String? _html;
  String? _download;
  String? _downloadLocation;

  String? get self => _self;
  String? get html => _html;
  String? get download => _download;
  String? get downloadLocation => _downloadLocation;

  Links({
      String? self, 
      String? html, 
      String? download, 
      String? downloadLocation}){
    _self = self;
    _html = html;
    _download = download;
    _downloadLocation = downloadLocation;
}

  Links.fromJson(Map<String, dynamic> json) {
    _self = json["self"];
    _html = json["html"];
    _download = json["download"];
    _downloadLocation = json["download_location"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["self"] = _self;
    map["html"] = _html;
    map["download"] = _download;
    map["download_location"] = _downloadLocation;
    return map;
  }

}

/// raw : "https://images.unsplash.com/photo-1536063211352-0b94219f6212?ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1"
/// full : "https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=85"
/// regular : "https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=1080"
/// small : "https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=400"
/// thumb : "https://images.unsplash.com/photo-1536063211352-0b94219f6212?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw2OTIyN3wwfDF8c2VhcmNofDF8fEJlYXV0aWZ1bCUyMGdpcmx8ZW58MHx8MXx8MTYyMjk3NzMyNg&ixlib=rb-1.2.1&q=80&w=200"

class Urls {
  String? _raw;
  String? _full;
  String? _regular;
  String? _small;
  String? _thumb;

  String? get raw => _raw;
  String? get full => _full;
  String? get regular => _regular;
  String? get small => _small;
  String? get thumb => _thumb;

  Urls({
      String? raw, 
      String? full, 
      String? regular, 
      String? small, 
      String? thumb}){
    _raw = raw;
    _full = full;
    _regular = regular;
    _small = small;
    _thumb = thumb;
}

  Urls.fromJson(Map<String, dynamic> json) {
    _raw = json["raw"];
    _full = json["full"];
    _regular = json["regular"];
    _small = json["small"];
    _thumb = json["thumb"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["raw"] = _raw;
    map["full"] = _full;
    map["regular"] = _regular;
    map["small"] = _small;
    map["thumb"] = _thumb;
    return map;
  }

}