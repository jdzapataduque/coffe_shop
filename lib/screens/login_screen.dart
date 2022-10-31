import 'dart:convert';
import 'package:coffe_shop/helpers/constants.dart';
import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/recovey_screen.dart';
import 'package:coffe_shop/screens/user_info_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:coffe_shop/screens/signup_screen.dart';
import 'app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class LoginInfo {
  final String f_customer_type;
  final String f_name;
  final String l_name;
  final String f_email;

  LoginInfo(this.f_customer_type, this.f_name, this.l_name, this.f_email);
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
      appBar: header(context, isAppTitle: true),
      body: Center(
          child: SingleChildScrollView(
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
      ))),
    );
  }

  Widget _showemail() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: errorHandling.getMessage('MSG0001'),
            labelText: errorHandling.getMessage('MSG0002'),
            errorText: _email_show_error ? _email_error : null,
            labelStyle: TextStyle(
              fontSize: 15,
              color: Color(0xffff0474),
              fontFamily: 'PoppinsBold',
            ),
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
        style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        onChanged: (value) {
          _email = value;
        },
      ),
    );
  }

  Widget _showPassword() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      //margin: EdgeInsets.only(top: 50),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: _isObscure,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: errorHandling.getMessage('MSG0003'),
            labelText: errorHandling.getMessage('MSG0004'),
            errorText: _password_show_error ? _password_error : null,
            labelStyle: TextStyle(
                fontSize: 15,
                color: Color(0xffff0474),
                fontFamily: 'PoppinsBold'),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xffff0474),
            ),
            suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                color: Color(0xffff0474),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffff0474)))),
        style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
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
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Poppins"),
        ));
  }

  Widget _showPasswordText() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          'Contraseña',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Poppins"),
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
                    errorHandling.getMessage('MSG0005'),
                    style: TextStyle(fontSize: 20, fontFamily: 'PoppinsBold'),
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
          errorHandling.getMessage('MSG0006'),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
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
                    errorHandling.getMessage('MSG0007'),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffff0474),
                        fontFamily: 'PoppinsBold'),
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
          errorHandling.getMessage('MSG0008'),
          style: TextStyle(
              fontSize: 20, color: Color(0xffff0474), fontFamily: 'Poppins'),
        ),
        onPressed: () => _go_to_recovery_passsword_page(),
      ),
    );
  }

  void _login() async {
    String responseJson = '';
    String customer_type = '';
    String f_name = '';
    String l_name = '';
    String wemail = '';

    if (!_validate_email()) {
      return;
    }

    if (!_validate_password()) {
      return;
    }

    //Ocultar la contraseña
    setState(() {
      _isObscure = true;
    });

    //Armar JSON para el API de login de la tienda del café
    Map<String, dynamic> request = {'user': _email, 'password': _password};
    var url = Uri.parse('${Constants.apiUrlLogin}');
    //Enviar petición POST al API de la tienda del café
    var response = await http.post(
      url,
      body: jsonEncode(request),
    );

    //Respuesta del body de JSON
    responseJson = response.body;
    //Obtener respuesta del body , debido a que el status code,
    //está devolviendo exitoso si el logueo es fallido
    Map<String, dynamic> userLogin = jsonDecode(responseJson);
    var rest = userLogin["authenticated"] as bool;

    //Validar respuesta del API del login con el status code
    // y el "authenticated" de la respuesta en el body
    if ((response.statusCode >= 400) || (!rest)) {
      setState(() {
        _isObscure = true;
        _password_show_error = true;
        _password_error = errorHandling.getError('TCF0006');
      });
      return;
    }

    var body = response.body;
    var decodedJson = jsonDecode(body);
    var token = Token.fromJson(decodedJson);
    print(token.token);

    customer_type = token.customerType.toString();
    f_name = token.firstName.toString();
    l_name = token.lastName.toString();
    wemail = token.email.toString();
    /*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Ingreso al sistema exitoso"),
    )); */
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new UserInfoScreen(
                logininfo:
                    new LoginInfo(customer_type, f_name, l_name, wemail))));
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

  void _go_to_recovery_passsword_page() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RecoveryScreen()));
  }
}
