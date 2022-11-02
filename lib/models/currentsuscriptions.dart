class CurrentSubscriptions {
  bool? isactive;
  String? image;
  String? title;
  int? cid;
  int? sid;
  String? subscriptionAddress1;
  String? subscriptionPhone;
  String? subscriptionCity;
  String? subscriptionProvinceCode;
  String? subscriptionProvince;
  String? subscriptionCode;
  String? subscriptionCountry;
  String? subscriptionZip;
  String? subscriptionShopifyId;
  String? subscriptionVariantId;
  String? subscriptionQuantity;
  String? subscriptionDate;
  String? subscriptionLastTransactionStatus;
  List<Upcomingcoffees>? upcomingcoffees;

  CurrentSubscriptions(
      {this.isactive,
      this.image,
      this.title,
      this.cid,
      this.sid,
      this.subscriptionAddress1,
      this.subscriptionPhone,
      this.subscriptionCity,
      this.subscriptionProvinceCode,
      this.subscriptionProvince,
      this.subscriptionCode,
      this.subscriptionCountry,
      this.subscriptionZip,
      this.subscriptionShopifyId,
      this.subscriptionVariantId,
      this.subscriptionQuantity,
      this.subscriptionDate,
      this.subscriptionLastTransactionStatus,
      this.upcomingcoffees});

  CurrentSubscriptions.fromJson(Map<String, dynamic> json) {
    isactive = json['isactive'];
    image = json['image'];
    title = json['title'];
    cid = json['cid'];
    sid = json['sid'];
    subscriptionAddress1 = json['subscription_address1'];
    subscriptionPhone = json['subscription_phone'];
    subscriptionCity = json['subscription_city'];
    subscriptionProvinceCode = json['subscription_province_code'];
    subscriptionProvince = json['subscription_province'];
    subscriptionCode = json['subscription_code'];
    subscriptionCountry = json['subscription_country'];
    subscriptionZip = json['subscription_zip'];
    subscriptionShopifyId = json['subscription_shopify_id'];
    subscriptionVariantId = json['subscription_variant_id'];
    subscriptionQuantity = json['subscription_quantity'];
    subscriptionDate = json['subscription_date'];
    subscriptionLastTransactionStatus =
        json['subscription_last_transaction_status'];
    if (json['upcomingcoffees'] != null) {
      upcomingcoffees = <Upcomingcoffees>[];
      json['upcomingcoffees'].forEach((v) {
        upcomingcoffees!.add(new Upcomingcoffees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isactive'] = this.isactive;
    data['image'] = this.image;
    data['title'] = this.title;
    data['cid'] = this.cid;
    data['sid'] = this.sid;
    data['subscription_address1'] = this.subscriptionAddress1;
    data['subscription_phone'] = this.subscriptionPhone;
    data['subscription_city'] = this.subscriptionCity;
    data['subscription_province_code'] = this.subscriptionProvinceCode;
    data['subscription_province'] = this.subscriptionProvince;
    data['subscription_code'] = this.subscriptionCode;
    data['subscription_country'] = this.subscriptionCountry;
    data['subscription_zip'] = this.subscriptionZip;
    data['subscription_shopify_id'] = this.subscriptionShopifyId;
    data['subscription_variant_id'] = this.subscriptionVariantId;
    data['subscription_quantity'] = this.subscriptionQuantity;
    data['subscription_date'] = this.subscriptionDate;
    data['subscription_last_transaction_status'] =
        this.subscriptionLastTransactionStatus;
    if (this.upcomingcoffees != null) {
      data['upcomingcoffees'] =
          this.upcomingcoffees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
