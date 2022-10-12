import 'package:coffe_shop/screens/login_screen.dart';
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
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('Paso a paso de recuperación enviado'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
