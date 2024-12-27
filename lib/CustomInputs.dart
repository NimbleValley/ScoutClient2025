import 'package:flutter/material.dart';

Widget createCounterWiget(IconData icon, Color color, VoidCallback increment, VoidCallback decrement) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: const Icon(Icons.remove),
        onPressed: decrement,
        iconSize: 75,
      ),
      Icon(
        Icons.speaker,
        color: color,
        size: 75,
      ),
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: increment,
        iconSize: 75,
      ),
    ],
  );
}

Widget createSelectWiget(String label, List<String> items, Function setText, Function getText, BuildContext context) {
  return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 25.0, bottom: 20),
          child: Text(label,
              style: TextStyle(fontSize: 36, fontFamily: 'Slabo')),
        ),
        SizedBox(
            height: 57,
            width: MediaQuery.of(context).size.width / 2,
            child: DropdownButton<String>(
              value: getText(),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.orangeAccent),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setText(value);


              },
              style: const TextStyle(fontSize: 32),
            ))
      ]);
}