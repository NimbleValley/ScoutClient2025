import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scouting2024/main.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

class SubmissionPageState extends State<SubmissionPage> {
  var commonImages = [
    'snow.jpg',
    'trompmil24.jpg',
    'sherrilwatching.jpg',
    'zachary01.jpg',
    'deva1.jpg',
    'sherrilglasses.jpg',
    'benjistache.jpg',
    'hensler.jpg',
    'thelm.jpg',
    'kniessXmason.jpg',
    'sherrilwithoutshoes.jpg',
    'james.jpg',
    'bensellchomp.jpg'
  ];
  var uncommonImages = [
    'sherril5.jpg',
    'joseph1.jpg',
    'aaron.jpg',
    'sherril3.jpg',
    'eLin.jpg',
    'taco-aaron.jpg',
    'BRAYDENNN.jpg',
    'cutefamilyphoto.jpg',
    'magnificantmalcom.jpg',
    'minidevas.jpg'
  ];
  var rareImages = [
    'bendi.jpg',
    'gabegrin.jpg',
    'sherrilyoung.jpg',
    'benjislacking.jpg',
    'zacharychiseled.jpg',
    'brightlnBALD.jpg'
  ];
  var epicImages = [
    'waytt.jpg',
    'hendrick.jpg',
    'zacharychomp.jpg',
    'amishbenji.jpg',
    'TheNewToolChest.jpg'
  ];
  var legendaryImages = ['gabefoot.jpg', 'benjifoot.jpg', 'sherrilbig.jpg'];

  void postData() async {
    final map = <String, dynamic>{};
    map['Name'] = nameValue.toString();
    map['Team Number'] = teamValue.toString();
    map['Alliance'] = allianceValue.toString();
    map['Match Number'] = matchValue.toString();

    map['Auto Speaker Made'] = autoSpeakerMadeCount.toString();
    map['Auto Speaker Missed'] = autoSpeakerMissedCount.toString();
    map['Starting Spot'] = autoStartingPosition.toString();

    map['Tele Speaker Made'] = teleSpeakerMadeCount.toString();
    map['Tele Speaker Missed'] = teleSpeakerMissedCount.toString();

    map['Climbed'] = climbed ? "Yes" : "No";

    map['Comments'] = commentText.toString();
    map['Driver Rating'] = driverSkillRating.toString();
    map['Intake Rating'] = intakeSpeedRating.toString();
    map['Cycle Rating'] = cycleSpeedRating.toString();

    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(map);
      var response = await dio
          .post(
              'https://script.google.com/macros/s/AKfycbzyACkTcrn0xFkrnhyMrE3Q9mLRHpqZ8MUWWGPzrqIDhEfGQROLUjYJRvtIuVAYDRbG/exec',
              data: formData)
          .timeout(const Duration(seconds: 20));
      setState(() {
        submissionDone = true;
      });
      return response.data;
    } on TimeoutException {
      setState(() {
        submissionDone = true;
        submissionFail = true;
      });
    } catch (e) {
      setState(() {
        submissionDone = true;
        submissionFail = true;
      });
    }
  }

  SubmissionPageState() {
    randomGenerator = Random(DateTime.now().millisecondsSinceEpoch);

    imageVisible = false;
    submissionDone = false;
    submissionFail = false;

    if (randomGenerator.nextDouble() >= 0.6) {
      tier = 0;
    } else {
      if (randomGenerator.nextDouble() >= 0.45) {
        tier = 1;
      } else {
        if (randomGenerator.nextDouble() >= 0.35) {
          tier = 2;
        } else {
          if (randomGenerator.nextDouble() >= 0.35) {
            tier = 3;
          } else {
            tier = 4;
          }
        }
      }
    }

    postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Submitting form...',
                style: TextStyle(
                    fontSize: 40, fontFamily: 'Branding', color: Colors.orange),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'While you wait, please enjoy this image:',
                  style: TextStyle(fontSize: 20, fontFamily: 'Slabo'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: getImageColor(),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                          color: Colors.black, width: 4)))),
                      onPressed: () {
                        if (!imageVisible) {
                          setState(() {
                            imageVisible = true;
                          });
                        }
                      },
                      child: AnimatedOpacity(
                          // If the widget is visible, animate to 0.0 (invisible).
                          // If the widget is hidden, animate to 1.0 (fully visible).
                          opacity: imageVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1500),
                          // The green box must be a child of the AnimatedOpacity widget.
                          child: Image.asset(getImage())))),
              AnimatedOpacity(
                  // If the widget is visible, animate to 0.0 (invisible).
                  // If the widget is hidden, animate to 1.0 (fully visible).
                  opacity: imageVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1500),
                  child: Text(
                    'You received $imageName. It is worth ${((tier + 1) * (tier + 1))} dollars. Enjoy!',
                    style: const TextStyle(fontSize: 18, color: Colors.white60),
                    textAlign: TextAlign.center,
                  )),
              AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: submissionDone ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Visibility(
                      visible: !submissionFail,
                      child: const Text(
                        'Successful submission! Click to start a new form.',
                        style: TextStyle(
                            fontSize: 18, color: Colors.lightGreenAccent),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Visibility(
                      visible: submissionFail,
                      child: const Text(
                        'Submission failed. click bottom bar to try again, download form, or erase data.',
                        style:
                            TextStyle(fontSize: 18, color: Colors.pinkAccent),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Visibility(
                      visible: !submissionFail,
                      child: TextButton(
                        onPressed: () {
                          resetForm();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomePage(
                                title: 'Test Version 2024 Scouting');
                          }));
                        },
                        child: const Text('Back to home'),
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
      bottomNavigationBar: Visibility(
        visible: submissionFail,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.redo),
                label: 'Try Resubmission',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: 'Download Data',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Delete Data',
              )
            ],
            onTap: (value) {
              if (value == 0) {
                setState(() {
                  submissionDone = false;
                  submissionFail = false;
                  postData();
                });
              }
              if (value == 2) {
                resetForm();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const HomePage(title: 'Test Version 2024 Scouting');
                }));
              }
            }),
      ),
    );
  }

  WidgetStateProperty<Color> getImageColor() {
    if (tier == 0) {
      return WidgetStateProperty.all<Color>(Colors.grey);
    }
    if (tier == 1) {
      return WidgetStateProperty.all<Color>(Colors.green);
    }
    if (tier == 2) {
      return WidgetStateProperty.all<Color>(Colors.blue);
    }
    if (tier == 3) {
      return WidgetStateProperty.all<Color>(Colors.purple);
    }
    return WidgetStateProperty.all<Color>(Colors.redAccent);
  }

  String getTierName() {
    if (tier == 0) {
      return 'common';
    }
    if (tier == 1) {
      return 'uncommon';
    }
    if (tier == 2) {
      return 'RARE';
    }
    if (tier == 3) {
      return 'EPIC';
    }
    return '--LEGENDARY--';
  }

  getImage() {
    if(imageName != "") {
      return 'images/$imageName';
    }

    if (tier == 0) {
      imageName = commonImages[
          (randomGenerator.nextDouble() * commonImages.length).floor()];
      return 'images/$imageName';
    }
    if (tier == 1) {
      imageName = uncommonImages[
          (randomGenerator.nextDouble() * uncommonImages.length).floor()];
      return 'images/$imageName';
    }
    if (tier == 2) {
      imageName = rareImages[
          (randomGenerator.nextDouble() * rareImages.length).floor()];
      return 'images/$imageName';
    }
    if (tier == 3) {
      imageName = epicImages[
          (randomGenerator.nextDouble() * epicImages.length).floor()];
      return 'images/$imageName';
    }
    imageName = legendaryImages[
        (randomGenerator.nextDouble() * legendaryImages.length).floor()];
    return 'images/$imageName';
  }
}

void resetForm() {
  allianceValue = 'Blue 1';
  teamValue = '-1';
  matchValue = (int.parse(matchValue) + 1).toString();

  autoSpeakerMadeCount = 0;
  autoSpeakerMissedCount = 0;
  autoStartingPosition = "Center";

  teleSpeakerMadeCount = 0;
  teleSpeakerMissedCount = 0;

  climbed = false;

  driverSkillRating = 3;
  intakeSpeedRating = 2;
  cycleSpeedRating = 2;
  commentText = "";
  imageVisible = false;
  submissionDone = false;
  submissionFail = false;

  imageName = '';
}
