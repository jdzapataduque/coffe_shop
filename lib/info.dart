import 'package:flutter/material.dart';
void main() =>   runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       // drawer: Container(),
        //appBar: customAppBar(),
        body:  Center(  child: Column(
            children: <Widget>[
          miCard("Libros",Icons.book,"Encuentra libros a buenos precios."),
              miCard("Accesorios",Icons.coffee_maker_outlined,"¿Eres un amante al café?  \n acá encontraras todo lo necesario."),
              miCard("Souvenirs",Icons.card_giftcard_sharp,"Encuentra pines, mugs, velas \n y muchos regalitos más."),


        ])),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



Card miCard(String titulo,IconData icono,String descripcion) {
  return Card(
    // Con esta propiedad modificamos la forma de nuestro card
    // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // Con esta propiedad agregamos margen a nuestro Card
    // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
    margin: EdgeInsets.all(15),
    // Con esta propiedad agregamos elevación a nuestro card
    // La sombra que tiene el Card aumentará
    elevation: 10,
    // La propiedad child anida un widget en su interior
    // Usamos columna para ordenar un ListTile y una fila con botones
    child: Column(
      children: <Widget>[
        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 15, 25, 0),
          title: Text(titulo),
          subtitle: Text(
              descripcion),
          leading: Icon(icono,color: Colors.pinkAccent,size: 40),
        ),
        // Usamos una fila para ordenar los botones del card
        /*Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(onPressed: () => {}, child: Text('Libros')),
            //TextButton(onPressed: () => {}, child: Text('Cancelar'))
          ],
        ),*/

        SizedBox(
          width: 70,
        child: Align(
  alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: () => 'Null',
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.pinkAccent)),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: const [
                  Icon(Icons.touch_app),
                  //Text('Libros', style: TextStyle( fontFamily: 'Poppins')),
                ],
              ),
            ),
          ),
        ),
        ),


      ],
    ),
  );
}



