import 'package:flutter/material.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/CustomStyles.dart';
import 'package:scouting2024/main.dart';

class EndgamePageState extends State<EndgamePage> {
  final String title = "Endgame Page";

  void setClimbed(bool value) {
    setState(() {
      climbed = value;
    });
  }

  bool getClimbed() {
    return climbed;
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
          createCheckboxWidget('Climbed:', setClimbed, getClimbed, context)
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
                return const TelePage();
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
