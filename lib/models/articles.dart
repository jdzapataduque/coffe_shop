import 'image.dart';

class Articles {
  String? title = '';
  Image? image = Image(createdAt: '', alt: '', width: 0, height: 0, src: '');

  Articles({required this.title, required this.image});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = Image.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image!.toJson();
    return data;
  }
}
