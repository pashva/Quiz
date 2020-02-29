import 'dart:ui';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Quiztime(),
          ),
          
        ),
      ),
      
    );
  }
}

class Quiztime extends StatefulWidget {
  @override
  _QuiztimeState createState() => _QuiztimeState();
}
int questionnum=0;
int score=0;
class _QuiztimeState extends State<Quiztime> {

  List<Icon> scorekeeper=[];

  List questions=[
    ' Lightning never strikes in the same place twice.',
    ' If you cry in space the tears just stick to your face.',
    ' If you cut an earthworm in half, both halves can regrow their body.',
    'Humans can distinguish between over a trillion different smells.',
    'Adults have fewer bones than babies do.',
  'Napoleon Bonaparte was extremely short.',
  ' Goldfish only have a memory of three seconds.',
  'There are more cells of bacteria in your body than there are human cells.',
  'Your fingernails and hair keep growing after you die.',
  'Birds are dinosaurs.',];

  List answers=[false,true,false,true,true,false,false,true,false,true];
  void checkT(int num) {
    if (num < questions.length) {
      if (answers[num] == true) {
        scorekeeper.add(Icon(Icons.check_circle, color: Colors.green,));

        questionnum++;
        score++;
        if(questionnum==10)
        {
          questionnum=0;
          scorekeeper=[];
          Alert(
            context: context,
            title: 'Finished!Your score is $score out of 10',
            desc: 'You\'ve reached the end of the quiz.',
          ).show();
          score=0;
        }
      }
      else {
          scorekeeper.add(Icon(Icons.not_interested, color: Colors.red,));
          questionnum++;
          if(questionnum==10)
          {
            questionnum=0;
            scorekeeper=[];
            Alert(
              context: context,
              title: 'Finished!Your score is $score out of 10',
              desc: 'You\'ve reached the end of the quiz.',
            ).show();
            score=0;
          }

        }
      }
    }

  void checkF(int num)
  {
    if (num < questions.length) {
      if (answers[num] == false) {
        scorekeeper.add(Icon(Icons.check_circle, color: Colors.green,));
        score++;

        questionnum++;
        if(questionnum==10)
        {
          questionnum=0;
          scorekeeper=[];
          Alert(
            context: context,
            title: 'Finished!Your score is $score out of 10',
            desc: 'You\'ve reached the end of the quiz.',
          ).show();
          score=0;
        }

      }

    else{
      scorekeeper.add(Icon(Icons.not_interested, color: Colors.red,));
      questionnum++;
      if(questionnum==10)
      {
        questionnum=0;
        scorekeeper=[];
        Alert(
          context: context,
          title: 'Finished!Your score is $score out of 10',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        score=0;
      }
    }}
  }

        @override
        Widget build(BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Center(
                    child: Text(
                      questions[questionnum], style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),),
                  ),
                ),),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          checkT(questionnum);
                        });
                      },
                      child: Text(
                        'True', style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 40.0),)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          checkF(questionnum);
                        });
                      },
                      child: Text(
                        'False', style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 40.0),)),
                ),
              ),
              Row(
                children: scorekeeper,
              )
            ],
          );
        }

    }

