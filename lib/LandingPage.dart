import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest7_1915016084_yudiaulia/Crud.dart';
import 'package:postest7_1915016084_yudiaulia/MainPage.dart';
import 'package:postest7_1915016084_yudiaulia/detail_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    Widget myButton() {
      return Row(
        children: [
          Container(
            width: lebar / 2.5,
            height: 50,
            margin: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.orange,
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: lebar / 2.5,
            height: 50,
            margin: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.orange,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Crud_Data();
                }));
              },
              child: const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget myKolom() {
      return Column(
        children: [
          Container(
            width: lebar / 1.3,
            height: 40,
            margin: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(255, 189, 180, 0.4),
            ),
            child: Text(
              "Email",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
          Container(
            width: lebar / 1.3,
            height: 40,
            margin: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(255, 189, 180, 0.4),
            ),
            child: Text(
              "Passwords",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        body: ListView(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: lebar,
                    height: 480,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: lebar,
                        height: 250,
                        margin: EdgeInsets.only(top: 25, left: 25, right: 25),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/home.png"),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SMART ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "HOME",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Control Your Home From Your Phone",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      myKolom()
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MainPage();
                  }));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              myButton(),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: const Text(
                  "Yudi Aulia 1915016084",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
