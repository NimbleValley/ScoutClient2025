import 'package:flutter/material.dart';

Widget createCounterWidget(IconData icon, Color color, VoidCallback increment,
    VoidCallback decrement) {
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

Widget createSelectWidget(String label, List<String> items, Function setText,
    Function getText, BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: 100,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Text(label,
                      textAlign: TextAlign.end,
                      style:
                          const TextStyle(fontSize: 36, fontFamily: 'Slabo'))),
            ),
            SizedBox(
                height: 57,
                width: MediaQuery.of(context).size.width / 3,
                child: ButtonTheme(
                    alignedDropdown: true,
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
                    )))
          ]));
}

Color checkColor(bool value) {
  if (value) {
    return Colors.green;
  }
  return Colors.red;
}

IconData checkIcon(bool value) {
  if (value) {
    return Icons.check;
  }
  return Icons.close;
}

Widget createCheckboxWidget(
    String label, Function setValue, Function getValue, BuildContext context) {
  return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        backgroundColor:
            WidgetStateProperty.all<Color>(const Color(0xFF453627)),
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0)),
      ),
      onPressed: () {
        bool newValue = !getValue();
        setValue(newValue);
        if (newValue) {}
      },
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: 85,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(label, style: const TextStyle(fontSize: 36)),
            Container(
              height: 64.0,
              width: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: checkColor(getValue()),
              ),
              child: Icon(checkIcon(getValue()), size: 40),
            )
          ])));
}

Widget createSliderWidget(String label, List<String> items, Function setValue,
    Function getValue, double max, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: Row(
        children: [
      SizedBox(
          width: MediaQuery.of(context).size.width / 2.1,
          child: Column(children: [
            Text(label,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 36, fontFamily: 'Slabo')),
            Text(items[getValue().round()-1],
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 20, fontFamily: 'Slabo', color: Colors.orangeAccent))
          ])),
      SizedBox(
        width: MediaQuery.of(context).size.width / 2.1,
        child: Slider(
          value: getValue(),
          max: max,
          min: 1,
          divisions: max.toInt() - 1,
          label: getValue().round().toString(),
          onChanged: (double value) {
            setValue(value);
          },
        ),
      )
    ]),
  );
}
