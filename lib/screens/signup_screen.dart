import 'dart:convert';
import 'package:coffe_shop/components/loader_component.dart';
import 'package:coffe_shop/helpers/constants.dart';
import 'package:coffe_shop/screens/drawer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:coffe_shop/screens/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'app_bar.dart';
import 'package:coffe_shop/models/signup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  //Variables del nombre
  String _name = '';
  String _name_error = '';
  bool _name_show_error = false;

  //Variables del apellido
  String _lastname = '';
  String _lastname_error = '';
  bool _lastname_show_error = false;

  //Variables del email
  String _email = '';
  String _email_error = '';
  bool _email_show_error = false;

  //Variables de la fecha de nacimiento
  String _birthdate = '';
  String _birthdate_error = '';
  bool _birthdate_show_error = false;
  TextEditingController _controller = TextEditingController();

  //Variables del género
  String _gender = '';
  String _gender_error = '';
  bool _gender_show_error = false;

  //Variables de la contraseña
  String _password = '';
  String _password_error = '';
  bool _password_show_error = false;
  bool _isObscure = true;
  bool _showLoader = false;

  ErrorMessages errorHandling = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _showname(),
              _showlastname(),
              _showemail(),
              _showBirthDate(),
              _showGender(),
              _showPassword(),
              _showButtonSignup(),
              _show_account_login_message(),
              _showButtonLogin(),
            ],
          ),
          _showLoader
              ? LoaderComponent(
                  text: 'Procesando registro...',
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _showname() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.name,
        decoration: estilizar(
            errorHandling.getMessage('MSG0011'),
            errorHandling.getMessage('MSG0010'),
            _name_show_error,
            _name_error,
            Icons.badge_outlined,
            Icons.person),
        style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        onChanged: (value) {
          _name = value;
        },
      ),
    );
  }

  Widget _showlastname() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.name,
        decoration: estilizar(
            errorHandling.getMessage('MSG0012'),
            errorHandling.getMessage('MSG0013'),
            _lastname_show_error,
            _lastname_error,
            Icons.badge_outlined,
            Icons.person),
        style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        onChanged: (value) {
          _lastname = value;
        },
      ),
    );
  }

  Widget _showemail() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: estilizar(
            errorHandling.getMessage('MSG0001'),
            errorHandling.getMessage('MSG0002'),
            _email_show_error,
            _email_error,
            Icons.alternate_email,
            Icons.email),
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        onChanged: (value) {
          _email = value;
        },
      ),
    );
  }

  Widget _showBirthDate() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.datetime,
        decoration: estilizar(
            errorHandling.getMessage('MSG0014'),
            errorHandling.getMessage('MSG0015'),
            _birthdate_show_error,
            _birthdate_error,
            Icons.date_range,
            Icons.calendar_month),
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        onChanged: (value) {
          _showDatePicker();
        },
        onTap: (() => _showDatePicker()),
      ),
    );
  }

  void _showDatePicker() async {
    String formatedDate = '';

    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xffff0474),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (newDate == null) {
      _controller.text = '';
      formatedDate = '';
    } else {
      formatedDate = DateFormat('yyyy-MM-dd').format(newDate);
      _controller.text = formatedDate;
    }
    _birthdate = formatedDate;
  }

  Widget _showGender() {
    String? genero;
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: DropdownButtonFormField(
        items: const [
          DropdownMenuItem(value: 'Masculino', child: Text('Masculino')),
          DropdownMenuItem(value: 'Femenino', child: Text('Femenino')),
        ],
        value: genero,
        icon: (Icon(
          Icons.arrow_drop_down,
          color: Color(0xffff0474),
        )),
        onChanged: (option) {
          genero = option;
          _gender = genero ?? "";
        },
        decoration: estilizar(
            errorHandling.getMessage('MSG0016'),
            errorHandling.getMessage('MSG0017'),
            _gender_show_error,
            _gender_error,
            Icons.male,
            Icons.female),
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _showPassword() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
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
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        onChanged: (value) {
          _password = value;
        },
      ),
    );
  }

  Widget _showButtonSignup() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 200,
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  child: Text(
                    errorHandling.getMessage('MSG0007'),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'PoppinsBold',
                    ),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => const Color(0xffff0474))),
                  onPressed: () => _signup(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _show_account_login_message() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          errorHandling.getMessage('MSG0018'),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ));
  }

  Widget _showButtonLogin() {
    return Container(
      width: 300,
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Expanded(
              child: SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  child: Text(
                    errorHandling.getMessage('MSG0005'),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffff0474),
                      fontFamily: 'PoppinsBold',
                    ),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _signup() async {
    setState(() {
      _isObscure = true;
    });
    if (!_validate_name()) {
      return;
    }

    if (!_validate_lastname()) {
      return;
    }

    if (!_validate_email()) {
      return;
    }

    if (!_validate_birthdate()) {
      return;
    }

    if (!_validate_gender()) {
      return;
    }

    if (!_validate_password()) {
      return;
    }

    setState(() {
      _showLoader = true;
    });

    Map<String, dynamic> request = {
      "first_name": _name,
      "last_name": _lastname,
      "useremail": _email,
      "birthdate": _birthdate,
      "usertype": "coffeelover",
      "gender": _gender,
      "password": _password
    };

    var url = Uri.parse('${Constants.apiUrlSignup}');
    var response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(request),
    );

    setState(() {
      _showLoader = false;
    });

    if (response.statusCode >= 400) {
      setState(() {});
      return;
    }
    var body = response.body;
    var decodedJson = jsonDecode(body);
    var code = Signup.fromJson(decodedJson).code;
    var verbose = Signup.fromJson(decodedJson).verbose;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(verbose ?? 'Registro procesado...'),
    ));

    if (code == 'OK11') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DrawerPage()));
    } else {
      if (code == 'TAKEN') {
        _email = '';
        _validate_email();
      }
    }
  }

  bool _validate_name() {
    _name_show_error = false;
    _name_error = '';

    if (_name.isEmpty) {
      _name_show_error = true;
      _name_error = errorHandling.getError('TCF0004');
      setState(() {});
      return false;
    }
    setState(() {});
    return true;
  }

  bool _validate_lastname() {
    _lastname_show_error = false;
    _lastname_error = '';

    if (_lastname.isEmpty) {
      _lastname_show_error = true;
      _lastname_error = errorHandling.getError('TCF0005');
      setState(() {});
      return false;
    }
    setState(() {});
    return true;
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

  bool _validate_birthdate() {
    _birthdate_show_error = false;
    _birthdate_error = '';

    if (_birthdate.isEmpty) {
      _birthdate_show_error = true;
      _birthdate_error = errorHandling.getError('TCF0007');
      setState(() {});
      return false;
    }

    setState(() {});
    return true;
  }

  bool _validate_gender() {
    _gender_show_error = false;
    _gender_error = '';

    if (_gender.isEmpty) {
      _gender_show_error = true;
      _gender_error = errorHandling.getError('TCF0008');
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

InputDecoration estilizar(
    String _hintText,
    String _labelText,
    bool _field_show_error,
    String _field_error,
    IconData _preIcon,
    IconData _sufIcon) {
  return InputDecoration(
      hintText: _hintText,
      labelText: _labelText,
      errorText: _field_show_error ? _field_error : null,
      labelStyle: const TextStyle(
          fontSize: 15, color: Color(0xffff0474), fontFamily: 'PoppinsBold'),
      prefixIcon: Icon(
        _preIcon,
        color: Color(0xffff0474),
      ),
      suffixIcon: Icon(
        _sufIcon,
        color: Color(0xffff0474),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffff0474))));
}
