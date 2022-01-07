import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'oldandnewbutn.dart';

bool check = false;

TextEditingController _contmobile = TextEditingController();
TextEditingController _contotp = TextEditingController();

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    getdate();
  }

  Future<void> getdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mobile = prefs.getString("mobile");
    String otp = prefs.getString("otp");

    if (mobile != null || otp != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OldNewScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/bg.svg",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1), //2/6

                  Center(
                      child: Column(
                    children: [
                      Icon(
                        Icons.person_add_alt_1_outlined,
                        size: 200,
                      ),
                      Text(
                        "Welcome Quiz Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _contmobile,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: 'Mobile Number',
                    ),
                    keyboardType: TextInputType.number,
                    // Only numbers can be entered
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _contotp,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: 'OTP',
                    ),
                    keyboardType: TextInputType.number,
                    // Only numbers can be entered
                  ),
                  // Spacer(), // 1/6
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Color(0xFF1C2341),
                  //     hintText: "Mobile number",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // 1/6

                  Row(
                    children: [
                      Checkbox(
                          value: check,
                          onChanged: (value) {
                            setState(() {
                              check = value;
                            });
                          }),
                      Text("Remember")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_contmobile.text != "" && _contotp.text != "") {
                        if (check == true) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          prefs.setString("mobile", _contmobile.text);
                          prefs.setString("otp", _contotp.text);
                          // ignore: deprecated_member_use
                          prefs.commit();
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OldNewScreen()));
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
                        "Login",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}































// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/constants.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'oldandnewbutn.dart';

// bool check = false;

// TextEditingController _contmobile = TextEditingController();
// TextEditingController _contotp = TextEditingController();

// class WelcomeScreen extends StatefulWidget {
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     getdate();
//   }

//   Future<void> getdate() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     String mobile = prefs.getString("mobile");
//     String otp = prefs.getString("otp");

//     if (mobile != null || otp != null) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => OldNewScreen()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SvgPicture.asset(
//             "assets/icons/bg.svg",
//             fit: BoxFit.fill,
//             width: double.infinity,
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Spacer(flex: 1), //2/6

//                   Center(
//                       child: Column(
//                     children: [
//                       Icon(
//                         Icons.person_add_alt_1_outlined,
//                         size: 200,
//                       ),
//                       Text(
//                         "Welcome Quiz Login",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ],
//                   )),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextField(
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     controller: _contmobile,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.greenAccent, width: 5.0),
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.grey, width: 5.0),
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                       hintText: 'Mobile Number',
//                     ),
//                     keyboardType: TextInputType.number,
//                     // Only numbers can be entered
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextField(
//                     controller: _contotp,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.greenAccent, width: 5.0),
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.grey, width: 5.0),
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                       hintText: 'OTP',
//                     ),
//                     keyboardType: TextInputType.number,
//                     // Only numbers can be entered
//                   ),

//                   SizedBox(
//                     height: 10,
//                   ),
//                   // 1/6

//                   Row(
//                     children: [
//                       Checkbox(
//                           value: check,
//                           onChanged: (value) {
//                             setState(() {
//                               check = value;
//                             });
//                           }),
//                       Text("Remember")
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       if (_contmobile.text != "" && _contotp.text != "") {
//                         if (check == true) {
//                           SharedPreferences prefs =
//                               await SharedPreferences.getInstance();

//                           prefs.setString("mobile", _contmobile.text);
//                           prefs.setString("otp", _contotp.text);
//                           prefs.commit();
//                         }
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => OldNewScreen()));
//                       }
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
//                       decoration: BoxDecoration(
//                         gradient: kPrimaryGradient,
//                         borderRadius: BorderRadius.all(Radius.circular(12)),
//                       ),
//                       child: Text(
//                         "Login",
//                         style: Theme.of(context).textTheme.button,
//                       ),
//                     ),
//                   ),
//                   Spacer(flex: 2), // it will take 2/6 spaces
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
