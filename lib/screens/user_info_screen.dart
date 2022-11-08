import 'package:coffe_shop/main.dart';
import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_bar.dart';

class UserInfoScreen extends StatefulWidget {
  final Token token;

  UserInfoScreen({required this.token});
  //const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String email = "";
  ErrorMessages getMessage = ErrorMessages();

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('userBody').toString();
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('userBody');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: DrawerPage(token: widget.token),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _showCustomerTypeTitle(),
          _showCustomerType(),
          _showNameTitle(),
          _showName(),
          _showemailTitle(),
          _showemail(),
          _showButtonLogout()
        ],
      ))),
    );
  }

// Widget _showImageUser() {
//     return Container(
//        margin: EdgeInsets.all(30),
//        child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ClipRect(

//           ),
//           FadeInImage(placeholder: AssetImage('assets\img\user.png'), image:
//           Image.network(widget.logininfo.))
//         ],

//        ),);
//   }

  Widget _showCustomerTypeTitle() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          getMessage.getMessage('MSG0009'),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffff0474),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Poppins"),
        ));
  }

  Widget _showCustomerType() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          widget.token.customerType.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Poppins"),
        ));
  }

  Widget _showNameTitle() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          getMessage.getMessage('MSG0010'),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffff0474),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Poppins"),
        ));
  }

  Widget _showName() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          '${widget.token.firstName} ${widget.token.lastName}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Poppins"),
        ));
  }

  Widget _showemailTitle() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          getMessage.getMessage('MSG0002'),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffff0474),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Poppins"),
        ));
  }

  Widget _showemail() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          widget.token.email.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Poppins"),
        ));
  }

  Widget _showButtonLogout() {
    return Container(
      padding: EdgeInsets.only(top: 35),
      width: 200,
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 45,
                width: 200,
                child: ElevatedButton(
                  child: Text(
                    getMessage.getMessage('MSG0019'),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PoppinsBold',
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => const Color(0xffff0474))),
                  onPressed: () {
                    logOut(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
