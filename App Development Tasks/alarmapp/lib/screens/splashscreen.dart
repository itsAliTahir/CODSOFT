import 'package:alarmapp/constants.dart';
import 'package:flutter/material.dart';
import 'mainPage.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen();

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1, milliseconds: 400)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => MyMainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: mainColor),
        child: Center(
          child: FloatingActionButton(
            onPressed: () {},
            heroTag: "Hello",
            elevation: 0,
            child: const Icon(
              Icons.add_alarm_sharp,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
