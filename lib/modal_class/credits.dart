class Credits {
  int id;
  List<Cast> cast;

  Credits({this.id, this.cast});

  Credits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Cast {
  int castId;
  String character;
  int id;
  String name;
  String profilePath;

  Cast(
      {this.castId,
      this.character,
      this.id,
      this.name,
  this.profilePath});

  Cast.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    return data;
  }
}
