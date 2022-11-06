import 'package:flutter/material.dart';
import 'raiting.dart';
class Review extends StatelessWidget{
  String pathImage="assets/img/persona.jpeg";
  String nameCustomer;
  String detailsCurtomer;
  String reviewCustomer;
  String commentCustomer;


  Review(this.pathImage, this.nameCustomer, this.detailsCurtomer,
      this.reviewCustomer, this.commentCustomer);

  @override
  Widget build(BuildContext context) {
    final photoCliente=Container(
      margin: EdgeInsets.only(
        top:20.0,
        left: 20.0
      ),
      width: 80.0,height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.fill,image:AssetImage(pathImage)),
      ),
    );
    final userName=Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(nameCustomer,textAlign: TextAlign.left,style: TextStyle(fontSize: 17.0,fontFamily: "Poppins"),),
    );
    final userInfo = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Text(detailsCurtomer,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13.0,
                color: Color(0xFFa3a5a7),
              )),
        ),
        Rating(stars: 2,marginLeft: 15,marginRight: 5,fontSize: 12,marginTop: 5)
      ],
    );
    final userComment=Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(commentCustomer,textAlign: TextAlign.left,style: TextStyle(fontSize: 12.0,fontFamily: "Poppins",fontWeight: FontWeight.bold),),
    );


    final userDetails=Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,userInfo,userComment
      ],
    );

return Row(
  children: <Widget>[
    photoCliente,userDetails
  ],

);

  }
  
}