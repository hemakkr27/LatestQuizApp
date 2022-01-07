// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FirstScreen.dart';

import 'login.dart';
import 'web_view_container.dart';

class OldNewScreen extends StatefulWidget {
  @override
  State<OldNewScreen> createState() => _OldNewScreenState();
}

class _OldNewScreenState extends State<OldNewScreen> {
  String url;

  @override
  void initState() {
    super.initState();
    getDate();
  }

  Future<void> getDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    mobile = prefs.getString("mobile");
    otp = prefs.getString("otp");

    url =
        "http://igmquiz.in/WebLogin.aspx" + "?mobile=" + mobile + "&otp=" + otp;
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
                  Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Welcome The Quiz Page",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Image.asset(
                        "assets/image_bgchg.png",
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),

                      SizedBox(
                        height: 14,
                      ),
                      Image.asset(
                        "assets/Braham Sarovar1.jpg",
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      // Image.asset(
                      //   "assets/krishn.png",
                      //   fit: BoxFit.fill,
                      //   width: double.infinity,
                      // ),
                      // SizedBox(
                      //   height: 24,
                      // ),

                      SizedBox(
                        height: 24,
                      ),
                      Image.asset(
                        "assets/image_bgchg.png",
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewContainer(url)));
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
                        "Start Quiz",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // 1/6
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.clear();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
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
                        "Log Out",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // InkWell(
                  //   onTap: () async {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => WelcomeScreen()));
                  //   },
                  //   child: Container(
                  //     width: double.infinity,
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                  //     decoration: BoxDecoration(
                  //       gradient: kPrimaryGradient,
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //     child: Text(
                  //       "Login Another User",
                  //       style: Theme.of(context).textTheme.button,
                  //     ),
                  //   ),
                  // ),

                  // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
