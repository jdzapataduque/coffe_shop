import 'subscriptionsavailable.dart';
import 'currentsuscriptions.dart';

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
