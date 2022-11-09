import 'package:coffe_shop/screens/card_susc_list_screen.dart';
import 'package:coffe_shop/screens/home_screen.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:flutter/material.dart';
import '../models/token.dart';

class DrawerPage extends StatefulWidget {
  static const appTitle = 'Tienda del café';
  final Token token;

  DrawerPage({required this.token});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DrawerPage> {
  ErrorMessages msgs = ErrorMessages();
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Text(
                msgs.getMessage('MSG0037'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'PoppinsBold',
                    fontSize: 18.0,
                    color: Colors.white,
                    height: 3.3),
              ),
            ),
            ListTile(
              selectedTileColor: Colors.blue,
              title: Text(msgs.getMessage('MSG0038'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),
              /*   shape:RoundedRectangleBorder(
                  side: BorderSide(color: Colors.pink, width: 2),
                  borderRadius: BorderRadius.circular(26),
                ),*/
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => HomeScreen(token: widget.token)));
              },
            ),
            ListTile(
              selectedTileColor: Colors.blue,
              title: Text(msgs.getMessage('MSG0039'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),
              /*   shape:RoundedRectangleBorder(
                  side: BorderSide(color: Colors.pink, width: 2),
                  borderRadius: BorderRadius.circular(26),
                ),*/
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              //  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
              //   tileColor:  Colors.pink,
              title: Text(msgs.getMessage('MSG0040'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CardListSuscriptions(token: widget.token)));
              },
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              //   contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
              //  tileColor:  Colors.pink,
              title: Text(msgs.getMessage('MSG0041'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              //   minLeadingWidth: 12,
              //   tileColor:  Colors.pink,
              title: Text(msgs.getMessage('MSG0042'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              //  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
              //  tileColor:  Colors.pink,
              title: Text(msgs.getMessage('MSG0043'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              //   dense:true,
              //  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
              // tileColor:  Colors.pink,
              title: Text(msgs.getMessage('MSG0044'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard, color: Colors.white),
              dense: true,
              contentPadding: EdgeInsets.only(left: 5.0, right: 5.0),
              //tileColor:  Colors.pink,
              title: Text(msgs.getMessage('MSG0045'),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsBold',
                      color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      );
}
