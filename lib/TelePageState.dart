import 'package:flutter/material.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/CustomStyles.dart';
import 'package:scouting2024/main.dart';

class TelePageState extends State<TelePage> {
  final String title = "Tele Page";

  void incrementSpeakerMade() {
    setState(() {
      teleSpeakerMadeCount++;
    });
  }

  void decrementSpeakerMade() {
    setState(() {
      if (teleSpeakerMadeCount > 0) {
        teleSpeakerMadeCount--;
      }
    });
  }

  void incrementSpeakerMissed() {
    setState(() {
      teleSpeakerMissedCount++;
    });
  }

  void decrementSpeakerMissed() {
    setState(() {
      if (teleSpeakerMissedCount > 0) {
        teleSpeakerMissedCount--;
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
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 5, color: Color(0xFF5e554d)),
                ),
              ),
              child: Column(children: [
                Text(
                  "Speaker Made: $teleSpeakerMadeCount",
                  style: CustomTextStyle.labelTextStyle,
                ),
                createCounterWidget(Icons.speaker, Colors.green,
                    incrementSpeakerMade, decrementSpeakerMade)
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
                  "Speaker Missed: $teleSpeakerMissedCount",
                  style: CustomTextStyle.labelTextStyle,
                ),
                createCounterWidget(Icons.speaker, Colors.red,
                    incrementSpeakerMissed, decrementSpeakerMissed)
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
