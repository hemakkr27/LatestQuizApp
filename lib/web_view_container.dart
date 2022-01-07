// ignore: unused_import
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

String mobile = "";
String otp = "";

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();

  _WebViewContainerState(this._url);
  // ignore: unused_field
  WebViewController _controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (context) {
          return WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },
              onProgress: (int progress) {
                <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: new CircularProgressIndicator(
                              strokeWidth: 15,
                              value: 1.0,
                            ),
                          ),
                        ),
                        Center(child: Text(('$progress%'))),
                      ],
                    ),
                  ),
                ];
              });
        }));
  }
}


















// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// String mobile = "";
// String otp = "";

// class WebViewContainer extends StatefulWidget {
//   final url;

//   WebViewContainer(this.url);

//   @override
//   createState() => _WebViewContainerState(this.url);
// }

// class _WebViewContainerState extends State<WebViewContainer> {
//   var _url;
//   final _key = UniqueKey();

//   _WebViewContainerState(this._url);
//   WebViewController _controller;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Builder(builder: (context) {
//           return WebView(
//               key: _key,
//               javascriptMode: JavascriptMode.unrestricted,
//               initialUrl: _url,
//               onWebViewCreated: (WebViewController webViewController) {
//                 _controller = webViewController;
//               },
//               onProgress: (int progress) {
//                 children:
//                 <Widget>[
//                   SizedBox(
//                     height: 200.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Center(
//                           child: Container(
//                             width: 200,
//                             height: 200,
//                             child: new CircularProgressIndicator(
//                               strokeWidth: 15,
//                               value: 1.0,
//                             ),
//                           ),
//                         ),
//                         Center(child: Text(('$progress%'))),
//                       ],
//                     ),
//                   ),
//                 ];
//               });
//         }));
//   }
// }
