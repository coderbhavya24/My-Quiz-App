import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquizapp/question.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.purple,
              Colors.blue,
              Colors.lightGreenAccent,
              Colors.green
            ])),
        child: Column(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 2 - 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'My Quiz App',
                style: TextStyle(
                  fontSize: 70,
                  fontFamily: 'Creepster',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 50, //height of button
            width: 300, //width of button
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text('Start Now', style: TextStyle(fontSize: 30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ques();
                  }),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
