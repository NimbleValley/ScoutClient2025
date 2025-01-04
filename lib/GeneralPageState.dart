import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/CustomStyles.dart';
import 'package:scouting2024/main.dart';

class GeneralPageState extends State<GeneralPage> {
  void setAlliance(String value) {
    setState(() {
      allianceValue = value;
    });
  }

  String getAlliance() {
    return allianceValue;
  }

  var matchTextController = TextEditingController();
  var teamTextController = TextEditingController();
  var nameTextController = TextEditingController();

  GeneralPageState() {
    if (matchValue != '-1') {
      matchTextController.text = matchValue;
    }
    if (teamValue != '-1') {
      teamTextController.text = teamValue;
    }
    if (nameValue != 'No name :(') {
      nameTextController.text = nameValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'General Information',
          style: TextStyle(
              fontSize: 30,
              decoration: TextDecoration.underline,
              decorationColor: Colors.orangeAccent,
              decorationThickness: 1),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 21.0, right: 10.0),
                        child: Text('Match #:',
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 36, fontFamily: 'Slabo')),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                              matchValue = value;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 3,
                            controller: matchTextController,
                            style: const TextStyle(
                                fontSize: 40.0, color: Colors.orangeAccent),
                            decoration: CustomTextInputDecoration
                                .createCustomInputDecoration('eg. 77')),
                      ),
                    )
                  ],
                )
              ]),
          createSelectWidget(
              "Alliance:",
              ['Blue 1', 'Blue 2', 'Blue 3', 'Red 1', 'Red 2', 'Red 3'],
              setAlliance,
              getAlliance,
              context),
          // ------------------------------------------------------------------------------------------------------
          // Team Number:
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 21.0, right: 10.0),
                        child: Text('Team #:',
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 36, fontFamily: 'Slabo')),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                              teamValue = value;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 5,
                            controller: teamTextController,
                            style: const TextStyle(
                                fontSize: 40.0, color: Colors.orangeAccent),
                            decoration: CustomTextInputDecoration
                                .createCustomInputDecoration('eg. 3197')),
                      ),
                    )
                  ],
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 21.0, right: 10.0),
                        child: Text('Name:',
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 36, fontFamily: 'Slabo')),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                              nameValue = value;
                            },
                            controller: nameTextController,
                            style: const TextStyle(
                                fontSize: 40.0, color: Colors.orangeAccent),
                            decoration: CustomTextInputDecoration
                                .createCustomInputDecoration('eg. Hendrick')),
                      ),
                    )
                  ],
                )
              ]),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const HomePage(title: 'Test Version 2024 Scouting');
              }));
            },
            child: const Text('Go Back'),
          ),
        ]),
      )),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.adb),
              label: 'Fake Button',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_sharp),
              label: 'Next',
            )
          ],
          onTap: (value) {
            if (value == 1) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const AutoPage();
              }));
            }
          }),
    );
  }
}
