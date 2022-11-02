import 'coffees.dart';

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
