class Suscriptions {
  List<CurrentSubscriptions>? currentSubscriptions;
  List<SubscriptionsAvailable>? subscriptionsAvailable;

  Suscriptions(
      {required this.currentSubscriptions,
      required this.subscriptionsAvailable});

  Suscriptions.fromJson(Map<String, dynamic> json) {
    if (json['current_subscriptions'] != null) {
      currentSubscriptions = <CurrentSubscriptions>[];
      json['current_subscriptions'].forEach((v) {
        currentSubscriptions!.add(new CurrentSubscriptions.fromJson(v));
      });
    }
    if (json['subscriptions_available'] != null) {
      subscriptionsAvailable = <SubscriptionsAvailable>[];
      json['subscriptions_available'].forEach((v) {
        subscriptionsAvailable!.add(new SubscriptionsAvailable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentSubscriptions != null) {
      data['current_subscriptions'] =
          this.currentSubscriptions!.map((v) => v.toJson()).toList();
    }
    if (this.subscriptionsAvailable != null) {
      data['subscriptions_available'] =
          this.subscriptionsAvailable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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

class Upcomingcoffees {
  int? id;
  String? handle;
  int? year;
  String? month;
  List<Coffees>? coffees;

  Upcomingcoffees({this.id, this.handle, this.year, this.month, this.coffees});

  Upcomingcoffees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    handle = json['handle'];
    year = json['year'];
    month = json['month'];
    if (json['coffees'] != null) {
      coffees = <Coffees>[];
      json['coffees'].forEach((v) {
        coffees!.add(new Coffees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['handle'] = this.handle;
    data['year'] = this.year;
    data['month'] = this.month;
    if (this.coffees != null) {
      data['coffees'] = this.coffees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coffees {
  String? handle;
  String? taste;
  String? body;
  String? height;
  String? region;
  String? video;

  Coffees(
      {this.handle,
      this.taste,
      this.body,
      this.height,
      this.region,
      this.video});

  Coffees.fromJson(Map<String, dynamic> json) {
    handle = json['handle'];
    taste = json['taste'];
    body = json['body'];
    height = json['height'];
    region = json['region'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['handle'] = this.handle;
    data['taste'] = this.taste;
    data['body'] = this.body;
    data['height'] = this.height;
    data['region'] = this.region;
    data['video'] = this.video;
    return data;
  }
}

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
