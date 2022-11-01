import 'package:flutter/material.dart';
import '../utils/color_utils.dart';
import 'search.dart';
import 'package:coffe_shop/screens/login_screen.dart';
class customAppBar extends StatelessWidget  implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/img/logo.PNG',
            scale: 2.5,
          ),
          const SizedBox(
            width: 10,
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
      ],
      backgroundColor: ("#FF0474").toColor(), //<-- SEE HERE
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(kToolbarHeight);
}


