import 'package:flutter/material.dart';
class Answer extends StatelessWidget {
final String answerText;
final Color answerColor;
final void Function() click;

 Answer({  required this.answerText , required this.answerColor , required this.click });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child:Container(
        height: 55,
        padding: EdgeInsets.fromLTRB(28, 1, 15, 15),
        margin: EdgeInsets.symmetric(vertical: 7),

        width: MediaQuery.of(context).size.width-60,
        decoration: BoxDecoration(
            color: answerColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Text(answerText,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Sch',
          ),),
      ),
    );
  }
}
