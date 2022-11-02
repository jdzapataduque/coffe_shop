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
