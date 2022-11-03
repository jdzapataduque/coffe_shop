import 'coords.dart';

class CoffeeShop {
  String? name = '';
  String? address1 = '';
  String? address2 = '';
  Coords? coords = Coords(lat: 0, lng: 0);
  String? placeid = '';
  String? category = '';

  CoffeeShop(
      {required this.name,
      required this.address1,
      required this.address2,
      required this.coords,
      required this.placeid,
      required this.category});

  CoffeeShop.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address1 = json['address1'];
    address2 = json['address2'];
    coords =
        json['coords'] != null ? new Coords.fromJson(json['coords']) : null;
    placeid = json['placeid'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['coords'] = this.coords!.toJson();
    data['placeid'] = this.placeid;
    data['category'] = this.category;
    return data;
  }
}
