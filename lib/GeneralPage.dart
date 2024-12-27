import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Information'),
      ),
      body: Center(
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 25.0, bottom: 20),
                  child: Text('Match #:',
                      style: TextStyle(fontSize: 36, fontFamily: 'Slabo')),
                ),
                SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      onChanged: (value) {
                        matchValue = value;
                        //Do something with the user input.
                      },
                      style: const TextStyle(
                          fontSize: 40.0, color: Colors.orangeAccent),
                      decoration: CustomTextInputDecoration.customInputDecoration
                    ))
              ]),
          createSelectWiget("Alliance:", [
            'Blue 1',
            'Blue 2',
            'Blue 3',
            'Red 1',
            'Red 2',
            'Red 3'
          ], setAlliance, getAlliance, context),
          // ------------------------------------------------------------------------------------------------------
          // Team Number:
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 25.0, bottom: 20),
                  child: Text('Team #:',
                      style: TextStyle(fontSize: 36, fontFamily: 'Slabo')),
                ),
                SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        teamValue = value;
                      },
                      style: const TextStyle(
                          fontSize: 40.0, color: Colors.orangeAccent),
                      decoration: CustomTextInputDecoration.customInputDecoration
                    ))
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 25.0, bottom: 20),
                  child: Text('Name:',
                      style: TextStyle(fontSize: 36, fontFamily: 'Slabo')),
                ),
                SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        nameValue = value;
                      },
                      style: const TextStyle(
                          fontSize: 40.0, color: Colors.orangeAccent),
                      decoration: CustomTextInputDecoration.customInputDecoration
                    ))
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