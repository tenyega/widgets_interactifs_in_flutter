import 'package:flutter/material.dart';

class InteractivePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InteractivePageState();
  }
}

class InteractivePageState extends State<InteractivePage> {
  Color _color = Colors.amber;
  String _textInput = "default text";
  bool _switchValue = false;
  double _sliderValue = 10;
  bool _checked = false;
  dynamic _groupValue = 1;
  dynamic _groupValue2 = 3;
  // Action when the button is clicked
  void changeColor() {
    setState(() {
      _color =
          _color == Colors.amber ? Colors.red : Colors.amber; // Toggle color
    });
  }

  void changeText(String value) {
    setState(() {
      _textInput = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Interactive Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue, // Sets the entire AppBar background color
      ),
      body: Center(
          child: Column(children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: _color, // Dynamically set the color using _color
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Center(
            child: Text(
              "Change My Color",
              style: TextStyle(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TextButton(
          onPressed: changeColor,
          child: Text("Change color"),
        ),
        ElevatedButton(
          onPressed: changeColor, // Function to change the color
          child: Text("Color "),
          // Text inside the button
        ),
        TextField(
          onSubmitted: (value) => changeText(value),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your name',
          ),
        ),
        Text(_textInput),
        Switch(
          activeColor: Colors.orange,
          value: _switchValue,
          onChanged: (newBool) {
            setState(() {
              _textInput = (newBool) ? "Switch true" : "Switch false";
              _switchValue = newBool;
            });
          },
        ),
        Slider(
          min: 0,
          max: 100,
          value: _sliderValue,
          onChanged: (double newValue) {
            setState(() {
              _textInput = "Valeur du slider : $newValue";
              _sliderValue = newValue;
            });
          },
        ),
        Checkbox(
          value: _checked,
          onChanged: (bool? value) {
            setState(() {
              _textInput = "Valeur du CheckBox : $value";
              _checked = value ?? false;
            });
          },
          splashRadius: 20, //round circle when hovered.
        ),
        radios(),
      ])
          // Center the rectangle in the body

          ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeColor, // Function to be called on button press
        child: Icon(Icons.favorite), // Icon to be displayed inside the button
      ),
    );
  }

// Radio buttons are always in the grouped form.
  Row radios() {
    List<Widget> radios = [];
    for (var i = 1; i < 6; i++) {
      Radio r = Radio(
        value: i,
        groupValue:
            _groupValue, // the group value of the radio button needs a dynamic value
        onChanged: (value) {
          setState(() {
            _groupValue = value as int;
            _textInput = "Valeur des radios : $_groupValue";
          });
        },
      );
      radios.add(r);
    }
    return Row(
      children: radios,
    );
  }
}
