import 'package:alarmapp/constants.dart';
import 'package:alarmapp/models/alarms.dart';
import 'package:flutter/material.dart';

class MyEditRingtoneSheet extends StatefulWidget {
  int i;
  Function remakeState;
  MyEditRingtoneSheet(this.i, this.remakeState);

  @override
  State<MyEditRingtoneSheet> createState() => _MyEditRingtoneSheetState();
}

class _MyEditRingtoneSheetState extends State<MyEditRingtoneSheet> {
  int highlighIndex = 0;
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: quaternaryColor, borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
      child: Column(children: [
        Container(
            height: 180,
            width: pageWidth,
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 5),
            child: ListView.separated(
              itemCount: AvailableTones.length,
              itemBuilder: (context, index) {
                if (widget.i != -1) {
                  highlighIndex = -1;
                }
                return GestureDetector(
                  onTap: () {
                    if (widget.i != -1) {
                      myAlarms[widget.i].alarmTone = AvailableTones[index];
                      setState(() {});
                      widget.remakeState(index);
                    } else {
                      highlighIndex = index;
                      widget.remakeState(index);
                      setState(() {});
                    }
                  },
                  child: Container(
                    color: (widget.i != -1 &&
                                myAlarms[widget.i].alarmTone ==
                                    AvailableTones[index]) ||
                            highlighIndex == index
                        ? Colors.black45
                        : Colors.transparent,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      height: 24,
                      width: pageWidth,
                      child: Text(
                        AvailableTones[index],
                        style: TextStyle(
                            color: (widget.i != -1 &&
                                        myAlarms[widget.i].alarmTone ==
                                            AvailableTones[index]) ||
                                    highlighIndex == index
                                ? fontColor
                                : fontColorDim,
                            fontWeight: (widget.i != -1 &&
                                        myAlarms[widget.i].alarmTone ==
                                            AvailableTones[index]) ||
                                    highlighIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontFamily: "TiltNeon"),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: pageWidth,
                  height: 1,
                  color: primaryColor,
                );
              },
            )),
      ]),
    );
  }
}
