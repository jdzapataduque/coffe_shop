import 'package:coffe_shop/models/image.dart';
import 'package:coffe_shop/models/images.dart';
import 'articles.dart';
import 'books.dart';
import 'events.dart';

class Coffeelover {
  List<Events>? events = [
    Events(
        description: '',
        end: '',
        id: 0,
        location: '',
        moreinfo: '',
        start: '',
        target: '',
        title: '')
  ];
  List<Articles>? articles = [
    Articles(
        title: '',
        image: Image(createdAt: '', alt: '', width: 0, height: 0, src: ''))
  ];
  List<Books>? books = [
    Books(title: '', handle: '', images: [
      Images(
          id: 0,
          productId: 0,
          position: 0,
          createdAt: '',
          updatedAt: '',
          width: 0,
          height: 0,
          src: '',
          adminGraphqlApiId: '')
    ])
  ];

  Coffeelover(
      {required this.events, required this.articles, required this.books});

  Coffeelover.fromJson(Map<String, dynamic> json) {
    events = <Events>[];
    json['events'].forEach((v) {
      events!.add(new Events.fromJson(v));
    });

    articles = <Articles>[];
    json['articles'].forEach((v) {
      articles!.add(new Articles.fromJson(v));
    });

    books = <Books>[];
    json['books'].forEach((v) {
      books!.add(new Books.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['events'] = this.events!.map((v) => v.toJson()).toList();
    data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    data['books'] = this.books!.map((v) => v.toJson()).toList();
    return data;
  }
}
