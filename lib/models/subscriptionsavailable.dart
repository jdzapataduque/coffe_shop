class SubscriptionsAvailable {
  String? productTitle;
  String? variantTitle;
  int? shopifyVariantId;
  int? productId;

  SubscriptionsAvailable(
      {this.productTitle,
      this.variantTitle,
      this.shopifyVariantId,
      this.productId});

  SubscriptionsAvailable.fromJson(Map<String, dynamic> json) {
    productTitle = json['product_title'];
    variantTitle = json['variant_title'];
    shopifyVariantId = json['shopify_variant_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_title'] = this.productTitle;
    data['variant_title'] = this.variantTitle;
    data['shopify_variant_id'] = this.shopifyVariantId;
    data['product_id'] = this.productId;
    return data;
  }
}
