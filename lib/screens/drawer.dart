import 'package:flutter/material.dart';
import 'app_bar.dart';
class DrawerPage extends StatefulWidget {
  static const appTitle = 'Tienda del café';
  @override
  _HomePageState createState()=>_HomePageState();
}
class _HomePageState extends State<DrawerPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:header(context,isAppTitle: true) ,
      body: const Center(
        child: Text('La tienda del café!'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
              /*    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                tileColor:  Colors.pink,*/
              selectedTileColor: Colors.blue,
              title: const Text('CAFÉS', style: TextStyle(fontSize: 16,fontFamily:'PoppinsBold',color: Colors.white )),
              /*   shape:RoundedRectangleBorder(
                  side: BorderSide(color: Colors.pink, width: 2),
                  borderRadius: BorderRadius.circular(26),
                ),*/
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

}


