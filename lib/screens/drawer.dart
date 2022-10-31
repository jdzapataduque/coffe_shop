import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
class DrawerPage extends StatefulWidget  {
  static const appTitle = 'Tienda del café';
  @override
  _HomePageState createState()=>_HomePageState();
}
class _HomePageState extends State<DrawerPage>{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((token) => print(token));
  }


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
              child: Text('MENÚ',  textAlign: TextAlign.center,
                style: TextStyle(  fontFamily: 'PoppinsBold',
                    fontSize: 16.0,color: Colors.white),
              ),
            ),
            ListTile(
              selectedTileColor: Colors.blue,
              title: const Text('CAFÉS', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold',color: Colors.white )),
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
              title: const Text('SUSCRIPCIONES', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold' ,color: Colors.white )),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ), SizedBox(
              height: 3,
            ),
            ListTile(
              //   contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
              //  tileColor:  Colors.pink,
              title: const Text('MÉTODOS', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold' ,color: Colors.white )),

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
              title: const Text('KITS & REGALOS', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold' ,color: Colors.white )),

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
              title: const Text('DULCES', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold' ,color: Colors.white )),

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
              title: const Text('OTROS', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold' ,color: Colors.white )),

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
              leading: Icon(Icons.card_giftcard,color: Colors.white),
              dense:true,
              contentPadding: EdgeInsets.only(left:5.0, right: 5.0),
              //tileColor:  Colors.pink,
              title: const Text('PUNTOS', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold' ,color: Colors.white )),
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





