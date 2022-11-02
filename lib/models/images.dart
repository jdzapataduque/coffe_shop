class Images {
  int? id = 0;
  int? productId = 0;
  int? position = 0;
  String? createdAt = '';
  String? updatedAt = '';
  int? width = 0;
  int? height = 0;
  String? src = '';
  String? adminGraphqlApiId = '';

  Images(
      {required this.id,
      required this.productId,
      required this.position,
      required this.createdAt,
      required this.updatedAt,
      required this.width,
      required this.height,
      required this.src,
      required this.adminGraphqlApiId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['src'] = this.src;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}
