import 'package:coffe_shop/models/shop.dart';

class CoffeeShop {
  List<Shop>? shop = [
    Shop(
        name: '',
        address1: '',
        address2: '',
        coords: null,
        placeid: '',
        category: '')
  ];

  CoffeeShop({required this.shop});

  CoffeeShop.fromJson(Map<String, dynamic> json) {
    if (json['shop'] != null) {
      shop = <Shop>[];
      json['shop'].forEach((v) {
        shop!.add(new Shop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shop != null) {
      data['shop'] = this.shop!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
