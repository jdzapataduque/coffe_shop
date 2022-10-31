import 'package:coffe_shop/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'app_bar.dart';

class UserInfoScreen extends StatefulWidget {
  final LoginInfo logininfo;
  UserInfoScreen({Key? key, required this.logininfo}) : super(key: key);
  //const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  ErrorMessages getMessage = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
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
          _showemail()
        ],
      ))),
    );
  }

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
          widget.logininfo.f_customer_type,
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
          '${widget.logininfo.f_name} ${widget.logininfo.l_name}',
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
          widget.logininfo.f_email,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Poppins"),
        ));
  }
}
