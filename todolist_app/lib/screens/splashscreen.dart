import 'package:flutter/material.dart';
import 'package:todolist_app/constants.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1, milliseconds: 400)).then((value) {
      Navigator.of(context).pushNamed("/homescreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: themeColor),
            child: Center(
              child: SizedBox(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        "ToDo App",
                        style: TextStyle(
                            color: fontColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico"),
                      ))
                    ]),
              ),
            )));
  }
}
