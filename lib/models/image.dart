class Image {
  String? createdAt = '';
  String? alt = '';
  int? width = 0;
  int? height = 0;
  String? src = '';

  Image(
      {required this.createdAt,
      required this.alt,
      required this.width,
      required this.height,
      required this.src});

  Image.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['alt'] = this.alt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['src'] = this.src;
    return data;
  }
}
