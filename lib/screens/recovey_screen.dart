import 'package:coffe_shop/error_messages.dart';
import 'package:coffe_shop/screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  String _email = '';
  String _email_error = '';
  bool _email_show_error = false;

  ErrorMessages errorHandling = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_showmsgText(), _showemail(), _showButtons()],
      ))),
    );
  }

  Widget _showmsgText() {
    return Container(
        padding: EdgeInsets.all(5),
        child: Text(
          'Le enviaremos un correo electrónico para restablecer su contraseña.',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }

  Widget _showemail() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 25),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Ingrese el correo electrónico...',
            labelText: 'Correo electrónico',
            errorText: _email_show_error ? _email_error : null,
            labelStyle: TextStyle(fontSize: 22, color: Color(0xffff0474)),
            prefixIcon: Icon(
              Icons.alternate_email,
              color: Color(0xffff0474),
            ),
            suffixIcon: Icon(
              Icons.email,
              color: Color(0xffff0474),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffff0474)))),
        style: TextStyle(fontSize: 23),
        onChanged: (value) {
          _email = value;
        },
      ),
    );
  }

  Widget _showButtons() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _showCancelButton(),
              SizedBox(
                width: 30,
              ),
              _showSendButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showCancelButton() {
    return SizedBox(
      width: 180,
      height: 45,
      child: Expanded(
        child: ElevatedButton(
          child: Text(
            'CANCELAR',
            style: TextStyle(fontSize: 22),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Color(0xFF666666);
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)))),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
        ),
      ),
    );
  }

  Widget _showSendButton() {
    return SizedBox(
      width: 180,
      height: 45,
      child: Expanded(
        child: ElevatedButton(
          child: Text(
            'ENVIAR',
            style: TextStyle(fontSize: 22),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Color(0xffff0474);
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)))),
          onPressed: () => _send_recovey_password(),
        ),
      ),
    );
  }

  void _send_recovey_password() {
    if (!_validate_email()) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Hemos enviado un correo electrónico con un enlace para actualizar su contraseña."),
    ));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  bool _validate_email() {
    _email_show_error = false;
    _email_error = '';

    if (_email.isEmpty) {
      _email_show_error = true;
      _email_error = errorHandling.getError('TCF0001');
      setState(() {});
      return false;
    }

    if (!EmailValidator.validate(_email)) {
      _email_show_error = true;
      _email_error = errorHandling.getError('TCF0002');
      setState(() {});
      return false;
    }

    setState(() {});
    return true;
  }

  Widget _show_alert_dialog() {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
