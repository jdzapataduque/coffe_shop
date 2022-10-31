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

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
