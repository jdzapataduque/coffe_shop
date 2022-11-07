import 'package:coffe_shop/models/suscriptions.dart';
import 'package:coffe_shop/screens/current_suscriptions_screen.dart';
import 'package:coffe_shop/screens/suscriptions_screen.dart';
import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/app_bar.dart';
import 'package:coffe_shop/screens/drawer.dart';
import 'package:flutter/material.dart';

class SuscriptionsTypeScreen extends StatefulWidget {
  final Token token;

  SuscriptionsTypeScreen({required this.token});

  @override
  State<SuscriptionsTypeScreen> createState() => _SuscriptionsTypeScreenState();
}

class _SuscriptionsTypeScreenState extends State<SuscriptionsTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(token: widget.token),
      appBar: customAppBar(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              _showCurrent(),
              _showAvailable(),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _showCurrent() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.all(5),
      width: 150,
      //margin: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 80,
                width: 150,
                child: ElevatedButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Suscripciones actuales',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                      SizedBox(
                        width: 2,
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
                  onPressed: () => Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              CurrentSuscriptionsScreen(token: widget.token))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _showAvailable() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.all(5),
      width: 150,
      //margin: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 80,
                width: 150,
                child: ElevatedButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Suscripciones disponibles',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                      SizedBox(
                        width: 2,
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
                  onPressed: () => Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              SuscriptionsScreen(token: widget.token))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
