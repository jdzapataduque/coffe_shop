class Events {
  String? description = '';
  String? end = '';
  int? id = 0;
  String? location = '';
  String? moreinfo = '';
  String? start = '';
  String? target = '';
  String? title = '';

  Events(
      {required this.description,
      required this.end,
      required this.id,
      required this.location,
      required this.moreinfo,
      required this.start,
      required this.target,
      required this.title});

  Events.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    end = json['end'];
    id = json['id'];
    location = json['location'];
    moreinfo = json['moreinfo'];
    start = json['start'];
    target = json['target'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['end'] = this.end;
    data['id'] = this.id;
    data['location'] = this.location;
    data['moreinfo'] = this.moreinfo;
    data['start'] = this.start;
    data['target'] = this.target;
    data['title'] = this.title;
    return data;
  }
}
