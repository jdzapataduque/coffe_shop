import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _showemailText(),
          _showemail(),
          _showPasswordText(),
          _showPassword(),
        ],
      )),
    );
  }

  Widget _showemail() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Ingrese el correo electrónico...',
            labelText: 'Correo electrónico',
            labelStyle: TextStyle(fontSize: 23, color: Color(0xffff0474)),
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

  Widget _showPassword() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.text,
        obscureText: _isObscure,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: 'Ingrese la contraseña...',
            labelText: 'Contraseña',
            labelStyle: TextStyle(fontSize: 23, color: Color(0xffff0474)),
            suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                color: Color(0xffff0474),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffff0474)))),
        style: TextStyle(fontSize: 23),
        onChanged: (value) {
          _password = value;
        },
      ),
    );
  }

  Widget _showemailText() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          'Correo electrónico',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }

  Widget _showPasswordText() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          'Contraseña',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }
}
