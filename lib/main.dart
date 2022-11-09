import 'dart:convert';
import 'package:coffe_shop/models/token.dart';
import 'package:coffe_shop/screens/home_screen.dart';
import 'package:coffe_shop/screens/login_screen.dart';
import 'package:coffe_shop/screens/wait_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isloading = true;
  bool _showLoginScreen = true;
  late Token _token;

  @override
  void initState() {
    super.initState();
    _getHome();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Container(),
        //appBar: customAppBar(),
        body: _isloading
            ? WaitScreen()
            : _showLoginScreen
                ? LoginScreen()
                : HomeScreen(token: _token),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void _getHome() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userBody = preferences.getString('userBody');
    if (userBody != null) {
      var decodedJson = jsonDecode(userBody);
      _token = Token.fromJson(decodedJson);
      _showLoginScreen = false;
    }

    _isloading = false;
    setState(() {});
  }
}
