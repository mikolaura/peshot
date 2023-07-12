import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {

  String text;
  Color color;
  Color textColor ;
  MainButton({
    Key? key,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), offset: Offset(0, 4),blurRadius: 4)],
      ),
      child: Center(
        child: Text(text, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21,
          color: textColor,
        ),),
      ),
    );
  }
}
