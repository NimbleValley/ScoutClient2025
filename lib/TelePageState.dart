import 'package:flutter/material.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/CustomStyles.dart';
import 'package:scouting2024/main.dart';

class TelePageState extends State<TelePage> {
  final String title = "Tele Page";

  void changeTeleL4(int value) {
    setState(() {
      if (teleL4 + value >= 0) {
        teleL4 += value;
        teleCoral += value;
      }
    });
  }

  void changeTeleL3(int value) {
    setState(() {
      if (teleL3 + value >= 0) {
        teleL3 += value;
        teleCoral += value;
      }
    });
  }

  void changeTeleL2(int value) {
    setState(() {
      if (teleL2 + value >= 0) {
        teleL2 += value;
        teleCoral += value;
      }
    });
  }

  void changeTeleL1(int value) {
    setState(() {
      if (teleL1 + value >= 0) {
        teleL1 += value;
        teleCoral += value;
      }
    });
  }

  void changeTeleMiss(int value) {
    setState(() {
      if (teleMiss + value >= 0) {
        teleCoral += value;
        teleMiss += value;
      }
    });
  }

  void changeTeleProcessor(int value) {
    setState(() {
      if (teleProcessor + value >= 0) {
        teleProcessor += value;
      }
    });
  }

  void changeTeleNet(int value) {
    setState(() {
      if (teleNet + value >= 0) {
        teleNet += value;
      }
    });
  }

  void changeTeleAlgaeRemoved(int value) {
    setState(() {
      if (teleAlgaeRemoved + value >= 0) {
        teleAlgaeRemoved += value;
      }
    });
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
                      "$teleL4",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.network_wifi, Colors.deepPurpleAccent,
                    changeTeleL4)
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
                      "$teleL3",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.network_wifi_3_bar, Colors.deepPurpleAccent,
                    changeTeleL3)
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
                      "$teleL2",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.network_wifi_2_bar, Colors.deepPurpleAccent,
                    changeTeleL2)
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
                      "$teleL1",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.network_wifi_1_bar, Colors.deepPurpleAccent,
                    changeTeleL1)
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
                      "Missed coral:   ",
                      style: CustomTextStyle.labelTextStyleUnbold,
                    ),
                    Text(
                      "$teleMiss",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.error_outline, Colors.red,
                    changeTeleMiss)
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
                      "$teleProcessor",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.lens_blur, Colors.lightGreen,
                    changeTeleProcessor)
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
                      "$teleNet",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(Icons.directions_boat, Colors.blueAccent,
                    changeTeleNet)
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
                      "$teleAlgaeRemoved",
                      style: CustomTextStyle.labelTextStyle,
                    ),
                  ],
                ),
                createCounterWidget(
                    Icons.cancel_outlined, Colors.lightGreen, changeTeleAlgaeRemoved)
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
                return const AutoPage();
              }));
            }
            if (value == 1) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const EndgamePage();
              }));
            }
          }),
    );
  }
}
