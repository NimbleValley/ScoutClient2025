import 'package:flutter/material.dart';
import 'package:scouting2024/AutoPage.dart';
import 'package:scouting2024/GeneralPage.dart';
import 'package:scouting2024/TelePage.dart';

void main() {
  runApp(const MyApp());
}

String allianceValue = 'Blue 1';
String nameValue = 'No name :(';
String teamValue = '-1';
String matchValue = '-1';

int autoSpeakerMadeCount = 0;
int autoSpeakerMissedCount = 0;
String autoStartingPosition = "Center";

int teleSpeakerMadeCount = 0;
int teleSpeakerMissedCount = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HexHound Scouting',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.orangeAccent,
          secondary: Colors.orange,
          surface: Color(0xFF29241F),
          error: Colors.redAccent,
          onError: Colors.white,
          onPrimary: Color(0xFF825911),
          onSecondary: Colors.black,
          onSurface: Colors.white,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Test Version 2024 Scouting'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    themeMode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          children: <Widget>[
            const Column(children: [
              Text(
                'HexHound Scouting',
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Branding',
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF00D586),
                    decorationThickness: 5),
                textAlign: TextAlign.center,
              ),
              Text(
                '*Test* version of scouting app.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ]),
            ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.orange),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: const BorderSide(
                              color: Colors.deepOrangeAccent, width: 2))),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const GeneralPage();
                  }));
                },
                child: const Text("New Match", style: TextStyle(fontSize: 36)))
          ],
        ),
      ),
    );
  }
}

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  GeneralPageState createState() => GeneralPageState();
}

class AutoPage extends StatefulWidget {
  const AutoPage({super.key});

  @override
  AutoPageState createState() => AutoPageState();
}

class TelePage extends StatefulWidget {
  const TelePage({super.key});

  @override
  TelePageState createState() => TelePageState();
}
