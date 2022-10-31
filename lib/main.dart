import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/drawer.dart';
import 'screens/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'screens/app_bar.dart';
//void main() =>   runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home:
          Scaffold(
            drawer: DrawerPage(),
            appBar: customAppBar() ,
            body: Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: imageSliders,
              ),
            ),
           ),
      debugShowCheckedModeBanner: false,);
  }}
