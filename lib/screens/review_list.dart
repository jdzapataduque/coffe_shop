import 'package:flutter/material.dart';
import 'review.dart';
class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Review("assets/img/persona.jpeg", "Estefania", "1 review 5 photos", "Excelente", "genial"),
    Review("assets/img/user.png", "Tatiana", "Me gusto la experiencia", "Excelente", "genial"),
  ],
);
  }
}