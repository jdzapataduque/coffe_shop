import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:coffe_shop/screens/slider.dart';
import 'package:coffe_shop/screens/mapa.dart';
import 'package:coffe_shop/screens/articles_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import '../helpers/constants.dart';
import '../models/coffeelover.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _showSlider(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              _showArticles(),
              _showStores(),
            ])
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
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: imageSliders,
    ));
  }

  Widget _showStores() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 150,
      //margin: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 200,
                width: 150,
                child: ElevatedButton(
                  child: Text(
                    'Tiendas',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'PoppinsBold',
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)))),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => const Color(0xffff0474)),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApp())), //apunta al mapa
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _showArticles() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 150,
      //margin: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 200,
                width: 150,
                child: ElevatedButton(
                  child: Text(
                    'Artículos',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'PoppinsBold',
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)))),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => const Color(0xffff0474)),
                  ),
                  //onPressed: () => Navigator.pushReplacement(context,
                  //    MaterialPageRoute(builder: (context) => MyApp())),
                  onPressed: () => _coffeeLover(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _coffeeLover() async {
    Map<String, dynamic> request = {
      "user": "mamesa@bancolombia.com.co",
    };

    var url = Uri.parse('${Constants.apiUrlCoffeeLover}');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'Token afc3b43cf132376a84fa8e445255f6565e1eea78'
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
    var events = Coffeelover.fromJson(decodedJson).books;

    for (var i = 0; i < articles!.length; i++) {
      print(articles[i].title);
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ArticlesScreen(articles: articles)));
  }
}
