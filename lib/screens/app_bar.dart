import 'package:flutter/material.dart';
import '../utils/color_utils.dart';
import 'search.dart';
import 'package:coffe_shop/screens/login_screen.dart';

AppBar header(context,
    {bool isAppTitle = false,
    String strTitle = "",
    disableBackButton = false}) {
  return AppBar(
    toolbarHeight: 85,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/img/logo.PNG',
          scale: 2.5,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.search_rounded),
        tooltip: 'Buscar',
        onPressed: () {
          showSearch(context: context, delegate: MySearch());
        },
      ),
      IconButton(
        icon: const Icon(Icons.account_circle_outlined),
        tooltip: 'Login',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
      IconButton(
        icon: const Icon(Icons.shopping_cart),
        tooltip: 'Carrito de compras',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Next page'),
                ),
                body: const Center(
                  child: Text(
                    'Carrito de compras',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
          ));
        },
      ),
    ],
    backgroundColor: ("#FF0474").toColor(), //<-- SEE HERE
  );
}
