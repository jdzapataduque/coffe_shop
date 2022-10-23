import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:coffe_shop/screens/login_screen.dart';
import 'package:intl/intl.dart';
import 'app_bar.dart';

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

  ErrorMessages errorHandling = ErrorMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Center(
        child: Center(
          child: SingleChildScrollView(
              child: Column(
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
          )),
        ),
      ),
    );
  }

  Widget _showname() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.name,
        decoration: estilizar('Ingrese el nombre...', 'Nombre',
            _name_show_error, _name_error, Icons.badge_outlined, Icons.person),
        style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        onChanged: (value) {
          _name = value;
        },
      ),
    );
  }

  Widget _showlastname() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.name,
        decoration: estilizar(
            'Ingrese el apellido...',
            'Apellido',
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
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: estilizar(
            'Ingrese el correo electrónico...',
            'Correo electrónico',
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
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.datetime,
        decoration: estilizar(
            'Seleccione la fecha de nacimiento...',
            'Fecha de nacimiento',
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
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
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
        decoration: estilizar('Seleccione el género...', 'Género',
            _gender_show_error, _gender_error, Icons.male, Icons.female),
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _showPassword() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: _isObscure,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: 'Ingrese la contraseña...',
            labelText: 'Contraseña',
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
                height: 45,
                width: 200,
                child: ElevatedButton(
                  child: Text(
                    'CREAR CUENTA',
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
          '¿Ya tienes una cuenta?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ));
  }

  Widget _showButtonLogin() {
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
                    'INGRESAR',
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

  void _signup() {
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
