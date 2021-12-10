import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquizapp/answer.dart';

class ques extends StatefulWidget {
  const ques({Key? key}) : super(key: key);

  @override
  _quesState createState() => _quesState();
}

class _quesState extends State<ques> {

  int _questionIndex = 0;
  int _flag=0;
  int _totalScore = 0;
  bool choice = false;
 void _after(String score) {
   setState(() {
      choice=true;
      if(score=='true')
        _totalScore+=2;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            Text(
              '${(_questionIndex+1).toString()}/${_questions.length}',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Sch',
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        automaticallyImplyLeading: false,
        title: Text('    My Quiz App',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,

        ),),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
              Color(0x09984FF),
              Colors.lightBlueAccent,
            ])),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 43,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width - 50,
                  color: Colors.transparent,
                  child: Text(
                    _questions[_questionIndex]['question'].toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Ves',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'].toString(),
                answerColor: choice ? answer['score'] == true ? Colors.green : Colors.red : Colors.cyan,
                click: () {
                  _after(answer['score'].toString());
                },
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  child: _flag== 1 ?
                  Text('Final Score = ${_totalScore.toString()}',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Sch',
                    ),)
                      : Container(
                    padding: EdgeInsets.only(bottom: 20),
                        child: IconButton(
                        onPressed: () {
                          setState(() {
                            if(_questionIndex< _questions.length-1) {
                              if(choice== true)
                              {_questionIndex++;
                              choice = false;
                            }}
                            else{
                              _flag=1;
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_forward,
                        size: 40,)),
                      ),

                ),

              ],
            ),
            //SizedBox(height: 15,),
            Container(
              color: Colors.transparent,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                Text(
                  'Score: ${_totalScore.toString()}/20',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Sch',
                  ),
                ),
              ],
            ),
            ),


          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'Q1. at is flutter ?',
    'answers': [
      {'answerText': 'OS Toolkit', 'score': true },
      {'answerText': 'OS DBMS', 'score': false},
      {'answerText': 'An APP', 'score': false},
      {'answerText': 'NOTA', 'score': false},
    ],
  },
  {
    'question': 'Q2. When was flutter\'s first version launched ?',
    'answers': [
      {'answerText': 'May 2018', 'score': false},
      {'answerText': 'May 2019', 'score': false},
      {'answerText': 'May 2017', 'score': true},
      {'answerText': 'May 2016', 'score': false},
    ],
  },
  {
    'question': 'Q3. Is flutter a programming language',
    'answers': [
      {'answerText': 'Yes', 'score': false},
      {'answerText': 'No', 'score': true},
      {'answerText': 'Not Sure', 'score': false},
      {'answerText': 'Probably', 'score': false},
    ],
  },
  {
    'question': 'Q4. How many types of widgets are there in flutter?',
    'answers': [
      {'answerText': '5', 'score': false},
      {'answerText': '2', 'score': true},
      {'answerText': '3', 'score': false},
      {'answerText': '4', 'score': false},
    ],
  },
  {
    'question': 'Q5. What is the command to get dependencies?',
    'answers': [
      {'answerText': 'pubget', 'score': false},
      {'answerText': 'get', 'score': false},
      {'answerText': 'pub upgrade', 'score': false},
      {'answerText': 'pub get', 'score': true},
    ],
  },
  {
    'question': 'Q6. What are the different build modes in Flutter?',
    'answers': [
      {'answerText': 'Profile', 'score': false},
      {'answerText': 'Debug', 'score': false},
      {'answerText': 'Release', 'score': false},
      {'answerText': 'ALL of the above', 'score': true},
    ],
  },
  {
    'question': 'Q7. In which folder you can find apk file?',
    'answers': [
      {'answerText': 'lib', 'score': false},
      {'answerText': 'build', 'score': true},
      {'answerText': 'ios', 'score': false},
      {'answerText': 'android', 'score': false},
    ],
  },
  {
    'question': 'Q8. Flutter is developed by?',
    'answers': [
      {'answerText': 'Microsoft', 'score': false},
      {'answerText': 'Google', 'score': true},
      {'answerText': 'Facebook', 'score': false},
      {'answerText': 'Apple', 'score': false},
    ],
  },
  {
    'question': 'Q9. ________ is the project\'s configuration file ',
    'answers': [
      {'answerText': 'project.iml', 'score': false},
      {'answerText': 'pubspec.look', 'score': false},
      {'answerText': 'pubspec.yaml', 'score': true},
      {'answerText': 'pubspec.aml', 'score': false},
    ],
  },
  {
    'question': 'Q10 .The Dart language can be complied _____',
    'answers': [
      {'answerText': 'AOT', 'score': false},
      {'answerText': 'JIT', 'score': false},
      {'answerText': 'Both', 'score': true},
      {'answerText': 'None', 'score': false},
    ],
  },

];
