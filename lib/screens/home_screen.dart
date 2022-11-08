import 'dart:convert';
import 'package:coffe_shop/models/books.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/screens/slider.dart';
import 'package:coffe_shop/screens/shopmap_screen.dart';
import 'package:coffe_shop/screens/cards_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import '../helpers/constants.dart';
import '../models/coffeelover.dart';
import '../models/token.dart';
import 'app_bar.dart';
import 'drawer.dart';
import 'review_list.dart';

class HomeScreen extends StatefulWidget {
  final Token token;

  HomeScreen({required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var _articles;
  var _events;
  var _books;

  @override
  void initState() {
    super.initState();
    _coffeeLover();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(token: widget.token),
      appBar: customAppBar(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _showSlider(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              _showArticles(),
              _showStores(),
            ]),
            new ReviewList(),
          ],
        ),
      ),
    );
  }

  Widget _showSlider() {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.7,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: imageSliders,
    ));
  }

  Widget _showStores() {
    return Container(
      padding: EdgeInsets.only(top: 1),
      width: 150,
      //margin: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 80,
                width: 145,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopMap(token: widget.token))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Tiendas',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        // <-- Icon
                        Icons.store,
                        size: 40.0,
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)))),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => const Color(0xffff0474)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showArticles() {
    return Container(
      padding: EdgeInsets.only(top: 2),
      width: 150,
      //margin: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 80,
                width: 145,
                child: ElevatedButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '#CoffeLovers',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        // <-- Icon
                        Icons.favorite_rounded,
                        size: 40.0,
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)))),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => const Color(0xffff0474)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardList(
                                  articles: _articles,
                                  events: _events,
                                  books: _books,
                                )));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _coffeeLover() async {
    Map<String, dynamic> request = {
      "user": widget.token.email.toString(),
    };

    var url = Uri.parse('${Constants.apiUrlCoffeeLover}');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': widget.token.token.toString(),
      },
    );

    if (response.statusCode >= 400) {
      setState(() {});
      return;
    }
    var body = response.body;
    var decodedJson = jsonDecode(body);
    var articles = Coffeelover.fromJson(decodedJson).articles;
    var books = Coffeelover.fromJson(decodedJson).books;
    var events = Coffeelover.fromJson(decodedJson).events;
    _articles = articles;
    _events = events;
    _books = books;
    setState(() {});
  }
}
