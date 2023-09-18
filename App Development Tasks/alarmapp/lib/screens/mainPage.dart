import 'package:alarmapp/models/alarms.dart';
import 'package:alarmapp/widgets/addAlarmDialog.dart';
import 'package:alarmapp/widgets/ringtoneSelectorSheet.dart';
import 'package:flutter/material.dart';
import '../widgets/alarmsList.dart';
import '../widgets/currentTime.dart';
import '../widgets/floatingAction.dart';
import 'package:alarmapp/constants.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    final double pageWidth = MediaQuery.of(context).size.width;
    final double pageHeight = MediaQuery.of(context).size.height;

    void remakeState(int index) {
      toDeleteIndex = index;
      setState(() {});
    }

    void addAlarmFun() {
      setState(() {});
      showDialog(
          context: context,
          builder: (_) {
            return MyAddAlarm(remakeState);
          });
    }

    void deleteAlarmFun() {
      if (toDeleteIndex != -1) {
        myAlarms.removeAt(toDeleteIndex);
      }
      setState(() {});
    }

    void editRingtuneFun(int index) {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) {
            return Container(
              color: Colors.transparent,
              height: 200,
              child: MyEditRingtoneSheet(index, remakeState),
            );
          });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        width: pageWidth,
        height: pageHeight,
        color: primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            MyCurrentTime(),
            MyAlarmsList(editRingtuneFun, remakeState),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyFloatingActionButton(
        addAlarmFun,
        deleteAlarmFun,
      ),
    );
  }
}
