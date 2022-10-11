import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/error_messages.dart';
import 'package:coffe_shop/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  String _email_error = '';
  String _password_error = '';
  bool _email_show_error = false;
  bool _password_show_error = false;
  bool _isObscure = true;

  ErrorMessages errorHandling = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _showemail(),
          //_showPasswordText(),
          _showPassword(),
          _showButtonLogin(),
          _show_account_register_message(),
          _showButton_create_account(),
          _show_password_recovery()
        ],
      )),
    );
  }

  Widget _showemail() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Ingrese el correo electrónico...',
            labelText: 'Correo electrónico',
            errorText: _email_show_error ? _email_error : null,
            labelStyle: TextStyle(fontSize: 22, color: Color(0xffff0474)),
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
      padding: EdgeInsets.all(5),
      //margin: EdgeInsets.only(top: 50),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: _isObscure,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: 'Ingrese la contraseña...',
            labelText: 'Contraseña',
            errorText: _password_show_error ? _password_error : null,
            labelStyle: TextStyle(fontSize: 22, color: Color(0xffff0474)),
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

  Widget _showButtonLogin() {
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
                    'INGRESAR',
                    style: TextStyle(fontSize: 22),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => const Color(0xffff0474))),
                  onPressed: () => _login(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _show_account_register_message() {
    return Container(
        padding: EdgeInsets.all(5),
        child: Text(
          '¿No tienes una cuenta aún?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _showButton_create_account() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: 300,
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 45,
                width: 300,
                child: ElevatedButton(
                  child: Text(
                    'CREAR CUENTA',
                    style: TextStyle(fontSize: 22, color: Color(0xffff0474)),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignupScreen())),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _show_password_recovery() {
    return Container(
      child: TextButton(
        child: Text(
          'He olvidado mi contraseña',
          style: TextStyle(fontSize: 20, color: Color(0xffff0474)),
        ),
        onPressed: () {
          print("ir donde mauro");
        },
      ),
    );
  }

  void _login() {
    if (!_validate_email()) {
      return;
    }

    if (!_validate_password()) {
      return;
    }
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

  bool _validate_password() {
    _password_show_error = false;
    _password_error = '';

    if (_password.isEmpty) {
      _password_show_error = true;
      _password_error = errorHandling.getError('TCF0003');
      setState(() {});
      return false;
    }

    setState(() {});
    return true;
  }
}
