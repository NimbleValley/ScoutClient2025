import 'package:flutter/material.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/CustomStyles.dart';
import 'package:scouting2024/main.dart';

class AutoPageState extends  State<AutoPage> {

  final String title = "Auto Page";

  void incrementSpeakerMade() {
    setState(() {
      autoSpeakerMadeCount++;
    });
  }

  void decrementSpeakerMade() {
    setState(() {
      if (autoSpeakerMadeCount > 0) {
        autoSpeakerMadeCount--;
      }
    });
  }

  void incrementSpeakerMissed() {
    setState(() {
      autoSpeakerMissedCount++;
    });
  }

  void decrementSpeakerMissed() {
    setState(() {
      if (autoSpeakerMissedCount > 0) {
        autoSpeakerMissedCount--;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createSelectWidget("Starting Spot:", [
            'Center',
            'Amp',
            'Source',
            'Weird'
          ], setStartingSpot, getStartingSpot, context),
          Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Text(
                  "Speaker Made: $autoSpeakerMadeCount",
                  style: CustomTextStyle.labelTextStyle,
                ),
                createCounterWidget(Icons.speaker, Colors.green, incrementSpeakerMade, decrementSpeakerMade)
              ])),
      Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 5, color: Color(0xFF5e554d)),

            ),
          ),
          child: Column(children: [
            Text(
              "Speaker Missed: $autoSpeakerMissedCount",
              style: CustomTextStyle.labelTextStyle,
            ),
            createCounterWidget(Icons.speaker, Colors.red, incrementSpeakerMissed, decrementSpeakerMissed)
          ])),
        ],
      )),
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
