class PaymentType {
  String type = "";
  List<PaymentTypes> data = [];

  PaymentType({required this.type, required this.data});

  PaymentType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new PaymentTypes.fromJson(v));
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

class PaymentTypes {
  String id = "";
  String image = "";
  String title = "";
  String description = "";
  String bgcolor = "";

  PaymentTypes(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.bgcolor});

  PaymentTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    bgcolor = json['bgcolor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['bgcolor'] = this.bgcolor;
    return data;
  }
}
