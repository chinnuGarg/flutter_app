class Favourite {
  String type = "";
  List<FavouriteList> data = [];

  Favourite({required this.type, required this.data});

  Favourite.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new FavouriteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavouriteList {
  String id = "";
  String name = "";
  String image = "";
  String flag = "";

  FavouriteList(
      {required this.id,
      required this.name,
      required this.image,
      required this.flag});

  FavouriteList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['flag'] = this.flag;
    return data;
  }
}
