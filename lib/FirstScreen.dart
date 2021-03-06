import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/quiz/components/progress_bar.dart';

import 'GitaQuiz10quest.dart';
import 'constants.dart';
import 'question_data/GitaQuiz.dart';
import 'question_data/englishquiz.dart';
import 'question_data/quest.dart';
//import 'screens/quiz/quiz_screen.dart';
import 'package:flutter_svg/svg.dart';
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primaryColor: Colors.black),
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.redAccent,
//             title: Text("kurukshetra Quiz"),
//             centerTitle: true,
//           ),
//           backgroundColor: Colors.white,
//           body: FirstHomeScreen(),
//         ),
//       ),
//     );
//   }
// }

class FirstHomeScreen extends StatefulWidget {
  @override
  _FirstHomeScreenState createState() => _FirstHomeScreenState();
}

class _FirstHomeScreenState extends State<FirstHomeScreen> {
  String _selectedGita = "GitaQuiz";

  bool _right_wrongValue = false;
  bool _showscorevalue = false;
  int totalcount = 0;

  TextEditingController _controller = new TextEditingController();
  TextEditingController _controller1 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Screen'),
      ),
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg",
              width: double.infinity, fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: 500,

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DropdownButton(
                          value: _selectedGita,
                          items: _dropDownItemGita(),
                          // elevation: 8,

                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconDisabledColor: Colors.redAccent,
                          iconEnabledColor: Colors.white,
                          isExpanded: true,
                          dropdownColor: Colors.teal[400],

                          onChanged: (value) {
                            setState(
                              () {
                                _selectedGita = value.toString();
                                if (_selectedGita == "GitaQuiz") {
                                  totalcount = Questions1.questions1.length;
                                } else if (_selectedGita == "EnglishQuiz") {
                                  totalcount = Questions2.questions2.length;
                                } else if (_selectedGita == "Others") {
                                  totalcount = Questions.questions.length;
                                }
                                _controller1.text = totalcount.toString();
                              },
                            );
                          },
                          hint: Text('Select GitaQuiz'),
                        ),
                      ),
                      // child: Text("new"),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      // decoration: BoxDecoration(
                      //     color: Colors.redAccent,
                      //     border: Border.all(width: 3, color: Colors.brown),
                      //     borderRadius: BorderRadius.circular(12),
                      //     shape: BoxShape.rectangle),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _controller1,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 3.0),
                        ),
                        hintText: 'Totalnumber',
                      ),
                      keyboardType: TextInputType.number,
                      // Only numbers can be entered
                    ),

                    // TextField(
                    //   controller: _controller1,

                    //   decoration: new InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: Colors.greenAccent,
                    //             width: 5.0,
                    //             style: BorderStyle.solid),
                    //       ),
                    //       labelText: "Totalnumber"),
                    //   keyboardType: TextInputType.number,
                    //   // Only numbers can be entered
                    // ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 3.0),
                        ),
                        hintText: 'Enter your number',
                      ),
                      keyboardType: TextInputType.number,
                      // Only numbers can be entered
                    ),
                    // TextField(
                    //   controller: _controller,
                    //   decoration: new InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: Colors.greenAccent,
                    //             width: 5.0,
                    //             style: BorderStyle.solid),
                    //       ),
                    //       labelText: "Enter your number"),
                    //   keyboardType: TextInputType.number,
                    //   // Only numbers can be entered
                    // ),
                    SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Show value Right or Wrong',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.teal[400])),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                        value: true,
                                        groupValue: _right_wrongValue,
                                        title: Text("Yes"),
                                        onChanged: (newValue) => setState(
                                            () => _right_wrongValue = true),
                                        activeColor: Colors.teal[400],
                                        selected: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                        value: false,
                                        groupValue: _right_wrongValue,
                                        title: Text(
                                          "No",
                                          style: TextStyle(
                                              color: Colors.teal[400]),
                                        ),
                                        onChanged: (newValue) => setState(
                                            () => _right_wrongValue = false),
                                        activeColor: Colors.teal[400],
                                        selected: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    // TextField(
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     // fillColor: Color(0xFF1C2341),
                    //     hintText: "Full Name",
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(12)),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Show Score Value',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.teal[400])),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                        value: true,
                                        groupValue: _showscorevalue,
                                        title: Text("Yes"),
                                        onChanged: (newValue) => setState(
                                            () => _showscorevalue = true),
                                        activeColor: Colors.teal[400],
                                        selected: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                        value: false,
                                        groupValue: _showscorevalue,
                                        title: Text("No",
                                            style: TextStyle(
                                                color: Colors.teal[400])),
                                        onChanged: (newValue) => setState(
                                            () => _showscorevalue = false),
                                        activeColor: Colors.teal[400],
                                        selected: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        if (int.parse(_controller.text) <= totalcount) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      // QuizScreen()
                                      GitaQuiz10quest(
                                        int.parse(_controller.text),
                                        _selectedGita,
                                        _right_wrongValue,
                                        _showscorevalue,
                                      )));
                        } else {
                          _controller.text;
                          AlertDialog alert = AlertDialog(
                            title: Text("Alert"),
                            content: Text(
                                " Add Entered Value less than and equal to " +
                                    _controller1.text),
                          );

                          // show the dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Lets Start Quiz",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItemGita() {
    List<String> showselectvalue = ["GitaQuiz", "EnglishQuiz", "Others"];
    return showselectvalue
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}

// class SecondHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Screen"),
//       ),
//       body: Center(
//         // ignore: deprecated_member_use
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

// class Third extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("tird Screen"),
//       ),
//       body: Center(
//         // ignore: deprecated_member_use
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
