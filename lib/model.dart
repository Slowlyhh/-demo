class AutoGenerate {
  AutoGenerate({
    required this.count,
    required this.start,
    required this.total,
    required this.subjects,
    required this.title,
  });
  late final int count;
  late final int start;
  late final int total;
  late final List<Subjects> subjects;
  late final String title;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    count = json['count'];
    start = json['start'];
    total = json['total'];
    subjects = List.from(json['subjects']).map((e)=>Subjects.fromJson(e)).toList();
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['start'] = start;
    _data['total'] = total;
    _data['subjects'] = subjects.map((e)=>e.toJson()).toList();
    _data['title'] = title;
    return _data;
  }
}

class Subjects {
  Subjects({
    required this.rating,
    required this.genres,
    required this.title,
    required this.casts,
    required this.collectCount,
    required this.originalTitle,
    required this.subtype,
    required this.directors,
    required this.year,
    required this.images,
    required this.alt,
    required this.id,
  });
  late final Rating rating;
  late final List<String> genres;
  late final String title;
  late final List<Casts> casts;
  late final int collectCount;
  late final String originalTitle;
  late final String subtype;
  late final List<Directors> directors;
  late final String year;
  late final Images images;
  late final String alt;
  late final String id;

  Subjects.fromJson(Map<String, dynamic> json){
    rating = Rating.fromJson(json['rating']);
    genres = List.castFrom<dynamic, String>(json['genres']);
    title = json['title'];
    casts = List.from(json['casts']).map((e)=>Casts.fromJson(e)).toList();
    collectCount = json['collect_count'];
    originalTitle = json['original_title'];
    subtype = json['subtype'];
    directors = List.from(json['directors']).map((e)=>Directors.fromJson(e)).toList();
    year = json['year'];
    images = Images.fromJson(json['images']);
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rating'] = rating.toJson();
    _data['genres'] = genres;
    _data['title'] = title;
    _data['casts'] = casts.map((e)=>e.toJson()).toList();
    _data['collect_count'] = collectCount;
    _data['original_title'] = originalTitle;
    _data['subtype'] = subtype;
    _data['directors'] = directors.map((e)=>e.toJson()).toList();
    _data['year'] = year;
    _data['images'] = images.toJson();
    _data['alt'] = alt;
    _data['id'] = id;
    return _data;
  }
}

class Rating {
  Rating({
    required this.max,
    required this.average,
    required this.stars,
    required this.min,
  });
  late final int max;
  late final dynamic average;
  late final String stars;
  late final int min;

  Rating.fromJson(Map<String, dynamic> json){
    max = json['max'];
    average = json['average'];
    stars = json['stars'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['max'] = max;
    _data['average'] = average;
    _data['stars'] = stars;
    _data['min'] = min;
    return _data;
  }
}

class Casts {
  Casts({
    this.alt,
    this.avatars,
    required this.name,
    this.id,
  });
  late final String? alt;
  late final Avatars? avatars;
  late final String name;
  late final String? id;

  Casts.fromJson(Map<String, dynamic> json){
    alt = json['alt'];
    avatars = json['avatars'] == null
        ? null
        : Avatars.fromJson(json['avatars']);
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['alt'] = alt;
    _data['avatars'] = avatars?.toJson();
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class Avatars {
  Avatars({
    required this.small,
    required this.large,
    required this.medium,
  });
  late final String small;
  late final String large;
  late final String medium;

  Avatars.fromJson(Map<String, dynamic> json){
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['small'] = small;
    _data['large'] = large;
    _data['medium'] = medium;
    return _data;
  }
}

class Directors {
  Directors({
    this.alt,
    this.avatars,
    required this.name,
    this.id,
  });
  late final String? alt;
  late final Avatars? avatars;
  late final String name;
  late final String? id;

  Directors.fromJson(Map<String, dynamic> json){
    alt = json['alt'];
    avatars = json['avatars'] == null
        ? null
        : Avatars.fromJson(json['avatars']);
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['alt'] = alt;
    _data['avatars'] = avatars?.toJson();
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class Images {
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });
  late final String small;
  late final String large;
  late final String medium;

  Images.fromJson(Map<String, dynamic> json){
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['small'] = small;
    _data['large'] = large;
    _data['medium'] = medium;
    return _data;
  }
}