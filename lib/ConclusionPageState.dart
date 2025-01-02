import 'package:flutter/material.dart';
import 'package:scouting2024/CustomInputs.dart';
import 'package:scouting2024/CustomStyles.dart';
import 'package:scouting2024/main.dart';

class ConclusionPageState extends State<ConclusionPage> {
  final String title = "Conclusion Page";

  var commentTextController = TextEditingController();

  ConclusionPageState() {
    if (commentText != 'No comment :(') {
      commentTextController.text = commentText;
    }
  }

  void setDriverSkill(double value) {
    setState(() {
      driverSkillRating = value;
    });
  }

  double getDriverSkillRating() {
    return driverSkillRating;
  }

  void setIntakeSpeed(double value) {
    setState(() {
      intakeSpeedRating = value;
    });
  }

  double getIntakeSpeedRating() {
    return intakeSpeedRating;
  }

  void setCycleSpeed(double value) {
    setState(() {
      cycleSpeedRating = value;
    });
  }

  double getCycleSpeedRating() {
    return cycleSpeedRating;
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
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.25,
                    child: TextField(
                        onChanged: (value) {
                          //Do something with the user input.
                          commentText = value;
                        },
                        maxLines: 9,
                        controller: commentTextController,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        decoration: CustomTextInputDecoration
                            .createCustomInputDecoration(
                                'Please write a helpful comment...')))
              ]),
          createSliderWidget(
              "Driver Skill:",
              ['Awful', 'Clunky', 'Alright', 'Good', 'Excellent'],
              setDriverSkill,
              getDriverSkillRating,
              5,
              context),
          createSliderWidget("Intake Speed:", ['Slow', 'Fair', 'Fast'],
              setIntakeSpeed, getIntakeSpeedRating, 3, context),
          createSliderWidget("Cycle Speed:", ['Slow', 'Fair', 'Fast'],
              setCycleSpeed, getCycleSpeedRating, 3, context),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  WidgetStateProperty.all<Color>(const Color(0xFF453627)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: const BorderSide(
                              color: Colors.orange, width: 4))),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return const SubmissionPage();
                      }));
                },
                child: const Text("Submit", style: TextStyle(fontSize: 36))),
          )
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
              icon: Icon(Icons.bathtub),
              label: 'Fake Button',
            )
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const EndgamePage();
              }));
            }
          }),
    );
  }
}
