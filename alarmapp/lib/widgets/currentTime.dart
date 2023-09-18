import 'package:alarmapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCurrentTime extends StatefulWidget {
  const MyCurrentTime({super.key});

  @override
  State<MyCurrentTime> createState() => _MyCurrentTimeState();
}

class _MyCurrentTimeState extends State<MyCurrentTime> {
  String currentTimeFormat(TimeOfDay time) {
    String returnHour = time.hour.toString();
    String returnMin = time.minute.toString();
    if (time.hour > 12) {
      returnHour = (time.hour - 12).toString();
    } else if (returnHour == "0") {
      returnHour = "12";
    }
    if (int.parse(returnHour) > 0 && int.parse(returnHour) < 10) {
      returnHour = "0$returnHour";
    } else {
      returnHour = returnHour;
    }
    if (time.minute < 10) {
      returnMin = "0${time.minute}";
    } else {
      returnMin = "${time.minute}";
    }
    return "$returnHour:$returnMin";
  }

  String dayPeriodFun(String timePeriod) {
    return "${timePeriod[timePeriod.length - 2]}${timePeriod[timePeriod.length - 1]}"
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final double pageWidth = MediaQuery.of(context).size.width;
    final double pageHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(10),
      width: pageWidth,
      height: 120,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            DateFormat.yMMMEd().format(DateTime.now()),
            style: const TextStyle(
                color: fontColor,
                fontWeight: FontWeight.bold,
                fontFamily: "TiltNeon"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentTimeFormat(TimeOfDay.now()),
                style: const TextStyle(
                    color: fontColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 48,
                    fontFamily: "TiltNeon"),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text(
                    dayPeriodFun(TimeOfDay.now().period.toString()),
                    style: const TextStyle(
                        color: fontColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "TiltNeon"),
                  ),
                  const SizedBox(
                    height: 7,
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
