class Country {
  String type = "";

  List<CountryList> data = [];

  Country({required this.type, required this.data});

  Country.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new CountryList.fromJson(v));
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

class CountryList {
  String id = "";
  String title = "";
  String flag = "";

  CountryList({required this.id, required this.title, required this.flag});

  CountryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['flag'] = this.flag;
    return data;
  }
}
