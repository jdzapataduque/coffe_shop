import 'dart:convert';
import 'package:coffe_shop/helpers/constants.dart';
import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/home_screen.dart';
import 'package:coffe_shop/screens/recovey_screen.dart';
import 'package:coffe_shop/screens/user_info_screen.dart';
import 'package:coffe_shop/utils/check_internet.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:coffe_shop/utils/error_messages.dart';
import 'package:coffe_shop/screens/signup_screen.dart';
import 'package:coffe_shop/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

import '../components/loader_component.dart';
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
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  String _email = '';
  String _password = '';
  String _email_error = '';
  String _password_error = '';
  bool _email_show_error = false;
  bool _password_show_error = false;
  bool _isObscure = true;
  bool _lock_button = false;
  bool _showloader = false;
  //UserInfo
  String customer_type = '';
  String f_name = '';
  String l_name = '';
  String wemail = '';
  late Token _token;

  ErrorMessages errorHandling = ErrorMessages();
  CheckInternet chkinternet = CheckInternet();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _LoginKeep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _showloader
              ? LoaderComponent(text: errorHandling.getMessage('MSG0032'))
              : Container(),
          _showTitle(),
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

  Widget _showTitle() {
    return Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 45),
        child: Text(errorHandling.getMessage('MSG0020'),
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'PoppinsBold',
                color: Color(0xffff0474))));
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
                  onPressed: () => _lock_button ? null : _login(),
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
        // padding: EdgeInsets.all(30),
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
                height: 40,
                width: 250,
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
                  onPressed: () => _lock_button
                      ? null
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen())),
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
        onPressed: () => _lock_button ? null : _go_to_recovery_passsword_page(),
      ),
    );
  }

  void _login() async {
    String responseJson = '';

    if (!_validate_email()) {
      setState(() {
        _lock_button = false;
      });
      return;
    }

    if (!_validate_password()) {
      setState(() {
        _lock_button = false;
      });
      return;
    }

    setState(() {
      _lock_button = true;
      _isObscure = true;
      _showloader = true;
    });

    //Revisar si hay conexi??n a internet
    if (await _check_internet()) {
      return;
    }

    //Armar JSON para el API de login de la tienda del caf??
    Map<String, dynamic> request = {'user': _email, 'password': _password};
    var url = Uri.parse('${Constants.apiUrlLogin}');
    //Enviar petici??n POST al API de la tienda del caf??
    var response = await http.post(
      url,
      body: jsonEncode(request),
    );
    //Validar respuesta del API del login con el status code
    // y el "authenticated" de la respuesta en el body
    if (response.statusCode >= 400) {
      setState(() {
        _isObscure = true;
        _lock_button = false;
        _showloader = false;
        chkinternet.ShowMsg(context, errorHandling.getMessage('MSG0035'),
            errorHandling.getMessage('MSG0048'));
        //_password_error = errorHandling.getError('TCF0006');
      });
      return;
    }
    //Respuesta del body de JSON
    responseJson = response.body;
    //Obtener respuesta del body , debido a que el status code,
    //est?? devolviendo exitoso si el logueo es fallido
    Map<String, dynamic> userLogin = jsonDecode(responseJson);
    var rest = userLogin["authenticated"] as bool;

    if (!rest) {
      setState(() {
        _isObscure = true;
        _password_show_error = true;
        _lock_button = false;
        _showloader = false;
        _password_error = errorHandling.getError('TCF0006');
      });
      return;
    }
    var body = response.body;
    var decodedJson = jsonDecode(body);
    var token = Token.fromJson(decodedJson);
    customer_type = token.customerType.toString();
    f_name = token.firstName.toString();
    l_name = token.lastName.toString();
    wemail = token.email.toString();
    globals.token = token;

    if (globals.token != null) {
      globals.tokenMobile = await _firebaseMessaging.getToken();

      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      print('User granted permission: ${settings.authorizationStatus}');


      RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          print('Message data: ${message}');
        }
      });


      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print('Message also contained a notification: ${message.notification
              ?.title}');


          const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');


          const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
          );

          const InitializationSettings initializationSettings =
          InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
          );

          await flutterLocalNotificationsPlugin.initialize(
            initializationSettings,
          );


          AndroidNotificationChannel channel = const AndroidNotificationChannel(
            'high channel',
            'Very important notification!!',
            description: 'the first notification',
            importance: Importance.max,
          );

          await flutterLocalNotificationsPlugin.show(
            1,
            message.notification?.title,
            message.notification?.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description),
            ),
          );

          print(message.data);
        }});

      Map<String, dynamic> requestEndPointRegisterMobile = {
        'token': globals.tokenMobile,
        'user': globals.token?.email.toString(),
        'arn': '${Constants.Arn}',
        'arntopic': '${Constants.ArnTopic}'
      };
      var urlEndPointRegisterMobile =
          Uri.parse('${Constants.EndPointRegisterMobile}');
      var responseEndPointRegisterMobile = await http.post(
        urlEndPointRegisterMobile,
        body: jsonEncode(requestEndPointRegisterMobile),
      );

      //Obtener respuesta del body , debido a que el status code,
      //est?? devolviendo exitoso si el logueo es fallido

      var decoderesponseendpoint =
          jsonDecode(responseEndPointRegisterMobile.body);
      var responseendpoint = jsonDecode(decoderesponseendpoint)["response"];
    }

    /*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Ingreso al sistema exitoso"),
    )); */
    setState(() {
      _lock_button = false;
      _showloader = false;
    });

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('userBody', body);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(token: token)),
        (Route route) => false);
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
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => RecoveryScreen(),
        ));
  }

  void _LoginKeep() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userBody = preferences.getString('userBody');
    if (userBody == null) {
      return;
    }
    var decodedJson = jsonDecode(userBody);
    _token = Token.fromJson(decodedJson);
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => UserInfoScreen(token: _token)));
  }

  Future<bool> _check_internet() async {
    if (await chkinternet.valInternet(context)) {
      setState(() {
        _isObscure = false;
        _showloader = false;
        _lock_button = false;
      });
      chkinternet.ShowMsg(context, errorHandling.getMessage('MSG0035'),
          errorHandling.getMessage('MSG0036'));
      return true;
    } else {
      return false;
    }
  }
}
