import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO Create Variables, List and Map
  String displayValue = "";
  List<DropdownMenuItem<String>> menuItems = List();
  final web = {
    "1": "Python",
    "2": "PHP",
    "3": "Node JS",
  };
  final app = {
    "1": "Flutter",
    "2": "Kotlin",
    "3": "Java",
  };
  final desktop = {
    "1": "JavaFx",
    "2": "Electron",
    "3": "Tkinter",
  };
  bool disableDropdown = true;
  //TODO Create Functions
  void populateWeb() {
    for (String key in web.keys) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: web[key],
          child: Center(
            child: Text(web[key]),
          ),
        ),
      );
    }
  }

  void populateApp() {
    for (String key in app.keys) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: app[key],
          child: Center(
            child: Text(app[key]),
          ),
        ),
      );
    }
  }

  void populateDesktop() {
    for (String key in desktop.keys) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: desktop[key],
          child: Center(
            child: Text(desktop[key]),
          ),
        ),
      );
    }
  }

  void firstSelectedValue(_value) {
    if (_value == "Web") {
      menuItems = [];
      populateWeb();
    } else if (_value == "App") {
      menuItems = [];
      populateApp();
    } else if (_value == "Desktop") {
      menuItems = [];
      populateDesktop();
    }
    setState(() {
      displayValue = _value;
      disableDropdown = false;
    });
  }

  void secondSelectedValue(_value) {
    setState(() {
      displayValue = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Multiple Dropdown', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                dropdownColor: Colors.grey.shade300,
                items: [
                  DropdownMenuItem<String>(
                    value: "Web",
                    child: Center(
                      child: Text('Web'),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "App",
                    child: Center(
                      child: Text('App'),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Desktop",
                    child: Center(
                      child: Text('Desktop'),
                    ),
                  ),
                ],
                onChanged: (_value) => firstSelectedValue(_value),
                hint: Text(
                  'Select any Field',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                dropdownColor: Colors.grey.shade300,
                items: menuItems,
                onChanged: disableDropdown
                    ? null
                    : (_value) => secondSelectedValue(_value),
                hint: Text(
                  'Select any Technology',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                disabledHint: Text('First Select your Field'),
              ),
            ),
            Center(
              child: Text(
                '$displayValue',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
