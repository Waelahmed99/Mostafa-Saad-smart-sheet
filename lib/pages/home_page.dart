// color #7610f7
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Text(
          "Mostafa Saad smart sheet",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Solve your sheets faster. You solve, we judge",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
            fontWeight: FontWeight.w300,
            letterSpacing: 0.6,
          ),
        ),
        SizedBox(height: 20),
        Image.asset(
          'assets/splash.jpg',
          width: 600,
        ),
        SizedBox(height: 100),
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Color(0xff7610f7),
          padding: EdgeInsets.all(10),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi there! Let's get to know this website more",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 13),
              Container(
                //  width: width > 1000 ? width / 2 : width,
                child: Text(
                  "This website is based on junior's Mostafa Saad's sheet for problem solving\nInstead of using a static Google Sheet for recording your submissions\nhere you can focus on solving, and we will do the rest for you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 100),
        FAQ(),
        SizedBox(height: 30),
      ],
    );
  }
}

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  Map<int, bool> show;
  List<Widget> questions;
  int numOfQuestions;
  int id;

  @override
  void initState() {
    super.initState();
    numOfQuestions = 50;
    id = 1;
    show = {};
    for (int i = 1; i <= numOfQuestions; i++) show[i] = false;
  }

  Widget createQuestions() {
    id = 1;
    questions = [
      questionAnswer(
        id: id++,
        question: "What is this Sheet?",
        answer: '''
          - Complete roadmap for newcomers: what to solve & algorithms to learn in order
          - Covering most of topics needed up to codeforces Div2-D
          - Problems of scales 1 - 5.5 / 10 + Few harder ones
          - Problems increase in difficulty per topic
          - Speed problems to maintain speed goals
          - A lot of recorded videos for problems solutions, especially for the entry levels (Arabic)	
          ''',
      ),
      SizedBox(height: 5),
      questionAnswer(
        id: id++,
        question: "How to train?",
        answer: '''
          - Blind-Order training style
          - Problems are distributed in sheets A, B, C1, C2, D1, D2, D3
          - This one is a roadmap. It targets learning the knowledge/skills in a consistent and balanced way
          - Every sheet page is on average harder than the previous sheet page
          - This is my recommended way, though most camps/training-approaches don't use this style			
          ''',
      ),
      SizedBox(height: 5),
      questionAnswer(
        id: id++,
        question: "Advantages of this Sheet?",
        answer: '''
          - To be a strong contestant, one has to take care of a number of quality and quantitiy factors
          ==> This roadmap does its best to satisfy that
          - Typical issues in our Arabian region: Guys with 700-1000 solved problems and still weak!
          - Why? 
          A) No specific roadmap or keep switching between them
          B) Training while knowing problem category / level
          C) Focus on specific online judge
          - Again, this sheet solves these issues
          - Allows you to write down your statiscs to learn from them (e.g. you consume much time in debugging)
          - Continuous refining based on feedback					
        ''',
      ),
      SizedBox(height: 5),
      questionAnswer(id: id++, question: "For Whom?", answer: '''
      A junior is anyone who does't master solving codeforces Div2-D.'''),
      SizedBox(height: 5),
      questionAnswer(id: id++, question: "Skills Goals", answer: '''
      Moving from Junior Level to Semi-Senior Level: A one who do pretty well in CF-Div2 A, B, C, D and similar levels (e.g. TC-Div2-1000)
      '''),
      SizedBox(height: 6),
      questionAnswer(id: id++, question: "Knowledge Goals", answer: '''
      Understand and build fair knowledge in some algorithms in Number Theory, Dynamic Programming, Greedy, Graph Theory and Search
      '''),
      SizedBox(height: 5),
      questionAnswer(
          id: id++, question: "Do I have to solve every problem?", answer: '''
      For Div2 (A, B, C1) => No. If you can move faster, do it. For Non CF problems (E.g. UVA), please solve all
      '''),
      SizedBox(height: 5),
      questionAnswer(id: id++, question: "Others solutions?", answer: '''
      If you solved a problem, please see some other accepted solutions in codeforces. You don't need to watch my linked videos unless can't solve
      '''),
      SizedBox(height: 5),
      questionAnswer(
          id: id++,
          question:
              "Are problems really sorted based on easiness? I don't feel so.",
          answer: '''
          They are sorted by easiness already. But, whatever order, anyone will find some are easy and some are hard in some order.
          That is, no one can give you a list that every problem for YOU is easier than the next problem.
          In other words, If we gave 100 problems to 10 students of same level to solve and told them rank from easy to hard, they will rank them differently.
          So, questions ordered by people average. The promise is, the problems will be within your range to solve.
          '''),
      SizedBox(height: 5),
      questionAnswer(
        id: id++,
        question:
            "I would like to freeze my study for 1-2 years to be good in problem-solving?",
        answer: '''
        I never liked that. Graduate on time. In your free times and vacations do more problem solving
        ''',
      ),
      SizedBox(height: 5),
      questionAnswer(
        id: id++,
        question:
            "Is it normal to re-solve a problem again and do same mistakes and take same time?",
        answer: '''
        Yes, happens a lot
        ''',
      ),
      SizedBox(height: 5),
      questionAnswer(
        id: id++,
        question: "Should I re-solve some of what I solved agian?",
        answer: '''
        No, always solve new problems. Revise your notes on lessons you learned from past problems
        ''',
      ),
    ];

    return Column(children: questions);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Frequently Asked Questions (FAQ)",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30),
        createQuestions(),
      ],
    );
  }

  Widget questionAnswer(
      {@required int id, @required String question, @required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              show[id] = !show[id];
            });
          },
          child: Text(
            question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: 5),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: show[id]
              ? Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 19,
                    letterSpacing: 0.6,
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
