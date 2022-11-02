import 'images.dart';

class Books {
  String? title = '';
  String? handle = '';
  List<Images>? images = [
    Images(
        id: 0,
        productId: 0,
        position: 0,
        createdAt: '',
        updatedAt: '',
        width: 0,
        height: 0,
        src: '',
        adminGraphqlApiId: '')
  ];

  Books({required this.title, required this.handle, required this.images});

  Books.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    handle = json['handle'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['handle'] = this.handle;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
