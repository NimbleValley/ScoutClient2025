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
        title: const Text('General Information'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 10),
                      child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: const Text('Match #:',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 36, fontFamily: 'Slabo'))),
                    ),
                    SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: TextField(
                            onChanged: (value) {
                              setState(() {
                                matchValue = value;
                              });
                              //Do something with the user input.
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
                                .createCustomInputDecoration('eg. 17')))
                  ])),
          createSelectWidget(
              "Alliance:",
              ['Blue 1', 'Blue 2', 'Blue 3', 'Red 1', 'Red 2', 'Red 3'],
              setAlliance,
              getAlliance,
              context),
          // ------------------------------------------------------------------------------------------------------
          // Team Number:
          SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 10),
                      child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: const Text('Team #:',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 36, fontFamily: 'Slabo'))),
                    ),
                    SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.8,
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
                                .createCustomInputDecoration('eg. 3197')))
                  ])),
          SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 10),
                      child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: const Text('Name:',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 36, fontFamily: 'Slabo'))),
                    ),
                    SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                              CustomTextInputDecoration
                                  .createCustomInputDecoration('eg. Hendrick');
                              nameValue = value;
                            },
                            controller: nameTextController,
                            style: const TextStyle(
                                fontSize: 40.0, color: Colors.orangeAccent),
                            decoration: CustomTextInputDecoration
                                .createCustomInputDecoration('eg. Hendrick')))
                  ])),
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
      ),
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
