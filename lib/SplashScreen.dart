import 'dart:async';
import 'package:flutter/material.dart';
import 'package:postest7_1915016084_yudiaulia/LandingPage.dart';

class splash_Screen extends StatefulWidget {
  const splash_Screen({Key? key}) : super(key: key);

  @override
  State<splash_Screen> createState() => _splash_ScreenState();
}

class _splash_ScreenState extends State<splash_Screen> {
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 400,
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 35,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  CircularProgressIndicator(),
                  SizedBox(height: 45,),
                  Text(
                    "Powered by: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
              SizedBox(height: 5,),
                  Text(
                    "IOT",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 204, 37, 246)
                      ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
