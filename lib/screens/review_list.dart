import 'package:flutter/material.dart';
import 'review.dart';
class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Review("assets/img/eb.jpg", "Estefania Bernal", "1 Review 5 fotos", "Excelente", "Bonito lugar, gracias",3.5),
    Review("assets/img/jd.jpg", "Juan Diego Zapata", "2 Review 2 fotos", "Excelente", "Me encanta poder elegir \n diferentes tipos de cafes",4),
    Review("assets/img/jose.jpg", "Juan Jose Foronda", "3 Reviews 4 fotos", "Muy rico el cafe", "Excelente atención",4.5),
    Review("assets/img/mesa.jpg", "Mauricio Mesa", "3 Reviews 4 fotos", "", "Muy rico el café",5),
  ],
);
  }
}