import 'package:flutter/material.dart';

Card carsProductos(String titulo,IconData icono,String descripcion) {
  return Card(
    // Con esta propiedad modificamos la forma de nuestro card
    // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 12,
    child: Column(
      children: <Widget>[
        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(contentPadding: EdgeInsets.fromLTRB(15, 15, 25, 0), title: Text(titulo), subtitle: Text(descripcion),
          leading: Icon(icono,color: Colors.pinkAccent,size: 40),
        ),

        SizedBox(
          width: 122,
          child: Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () => 'Hola',
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.pinkAccent)),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Icon(Icons.touch_app),
                    Text('Ver más', style: TextStyle( fontFamily: 'PoppinsBold')),
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