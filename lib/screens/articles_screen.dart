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
    return ListView(
      children: widget.articles.map((e) {
        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        e.title.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        e.title.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
