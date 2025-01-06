import 'package:flutter/material.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/main.dart';

class EndgamePageState extends State<EndgamePage> {
  final String title = "Endgame Page";

  void setShallow(bool value) {
    setState(() {
      shallowClimb = value;
    });
  }

  bool getShallow() {
    return shallowClimb;
  }

  void setDeep(bool value) {
    setState(() {
      deepClimb = value;
    });
  }

  bool getDeep() {
    return deepClimb;
  }

  void setPark(bool value) {
    setState(() {
      park = value;
    });
  }

  bool getPark() {
    return park;
  }

  void setClimbType(String type) {
    setState(() {
      if (type == 'None') {
        shallowClimb = false;
        deepClimb = false;
      } else if (type == 'Shallow') {
        shallowClimb = true;
        deepClimb = false;
        park = false;
      } else if (type == 'Deep') {
        shallowClimb = false;
        deepClimb = true;
        park = false;
      }
    });
  }

  String getClimbType() {
    if (!shallowClimb && !deepClimb) {
      return 'None';
    }
    if (shallowClimb) {
      return 'Shallow';
    }
    return 'Deep';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 30,
              decoration: TextDecoration.underline,
              decorationColor: Colors.orangeAccent,
              decorationThickness: 1),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createSelectWidget("Climb Type:", ['None', 'Shallow', 'Deep'],
              setClimbType, getClimbType, context),
          Visibility(
              visible: (!shallowClimb && !deepClimb),
              child: createCheckboxWidget('Parked', setPark, getPark, context))
        ],
      ))),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_sharp),
              label: 'Back',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_sharp),
              label: 'Next',
            )
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const TelePage();
              }));
            }
            if (value == 1) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const ConclusionPage();
              }));
            }
          }),
    );
  }
}
