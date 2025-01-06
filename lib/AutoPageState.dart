import 'package:flutter/material.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/CustomStyles.dart';
import 'package:scouting2024/main.dart';

class AutoPageState extends State<AutoPage> {
  final String title = "Auto Page";

  void changeAutoL4(int value) {
    setState(() {
      if (autoL4 + value >= 0) {
        autoL4 += value;
        autoCoral += value;
      }
    });
  }

  void changeAutoL3(int value) {
    setState(() {
      if (autoL3 + value >= 0) {
        autoL3 += value;
        autoCoral += value;
      }
    });
  }

  void changeAutoL2(int value) {
    setState(() {
      if (autoL2 + value >= 0) {
        autoL2 += value;
        autoCoral += value;
      }
    });
  }

  void changeAutoL1(int value) {
    setState(() {
      if (autoL1 + value >= 0) {
        autoL1 += value;
        autoCoral += value;
      }
    });
  }

  void changeAutoMiss(int value) {
    setState(() {
      if (autoMiss + value >= 0) {
        autoCoral += value;
        autoMiss += value;
      }
    });
  }

  void changeAutoProcessor(int value) {
    setState(() {
      if (autoProcessor + value >= 0) {
        autoProcessor += value;
      }
    });
  }

  void changeAutoNet(int value) {
    setState(() {
      if (autoNet + value >= 0) {
        autoNet += value;
      }
    });
  }

  void changeAutoAlgaeRemoved(int value) {
    setState(() {
      if (autoAlgaeRemoved + value >= 0) {
        autoAlgaeRemoved += value;
      }
    });
  }

  void setStartingSpot(String value) {
    setState(() {
      autoStartingPosition = value;
    });
  }

  String getStartingSpot() {
    return autoStartingPosition;
  }

  void setLeave(bool value) {
    setState(() {
      autoLeave = value;
    });
  }

  bool getLeave() {
    return autoLeave;
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
          createSelectWidget(
              "Starting Spot:",
              ['Center', 'Amp', 'Source', 'Weird'],
              setStartingSpot,
              getStartingSpot,
              context),
              createCheckboxWidget('Left?', setLeave, getLeave, context),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "L-four:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoL4",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(
                    Icons.network_wifi, Colors.deepPurpleAccent, changeAutoL4)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "L-three:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoL3",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.network_wifi_3_bar,
                    Colors.deepPurpleAccent, changeAutoL3)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "L-two:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoL2",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.network_wifi_2_bar,
                    Colors.deepPurpleAccent, changeAutoL2)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "L-one:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoL1",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.network_wifi_1_bar,
                    Colors.deepPurpleAccent, changeAutoL1)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Missed auto coral:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoMiss",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(
                    Icons.error_outline, Colors.red, changeAutoMiss)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Processor:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoProcessor",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(
                    Icons.lens_blur, Colors.lightGreen, changeAutoProcessor)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Net:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoNet",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(
                    Icons.directions_boat, Colors.blueAccent, changeAutoNet)
              ])),
          Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Algae removed:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$autoAlgaeRemoved",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(
                    Icons.cancel_outlined, Colors.lightGreen, changeAutoAlgaeRemoved)
              ])),
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
                return const GeneralPage();
              }));
            }
            if (value == 1) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const TelePage();
              }));
            }
          }),
    );
  }
}
