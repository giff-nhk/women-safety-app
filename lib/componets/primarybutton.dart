import 'package:flutter/material.dart';
import 'package:liki_pro/ulits/constant.dart';

// ignore: must_be_immutable
class Primarybutton extends StatelessWidget {
  final String title;
  final Function onPressed;
  bool loading;
  Primarybutton ({required this.title, required this.onPressed, this.loading = false});


  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(onPressed:(){
        onPressed();
      }, child: Text(title,
      style: TextStyle(fontSize: 18),),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),),
    );
  }
}