import 'package:flutter/material.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'app_bar.dart';
import 'package:coffe_shop/models/articles.dart';

class ArticlesScreen extends StatefulWidget {
  final List<Articles> articles;

  ArticlesScreen({required this.articles});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreen();
}

class _ArticlesScreen extends State<ArticlesScreen> {
  ErrorMessages errorHandling = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _showarticles(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showarticles() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.name,
        /*decoration: estilizar(
            errorHandling.getMessage('MSG0011'),
            errorHandling.getMessage('MSG0010'),
            _name_show_error,
            _name_error,
            Icons.badge_outlined,
            Icons.person),*/
        style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
      ),
    );
  }
}
