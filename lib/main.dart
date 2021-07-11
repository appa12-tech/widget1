import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

enum Animal { Cat, Dog, Man, Fish }

class _MyAppState extends State<MyApp> {
  Animal selected = Animal.Cat;
  String values = "Make a Selection";
  List<PopupMenuEntry<Animal>> items = <PopupMenuEntry<Animal>>[];
  double _value = 0.0;

  void _onChanged(double value) => setState(() => _value = value);
  @override
  void initState() {
    for (Animal animal in Animal.values) {
      items.add(PopupMenuItem(
        child: Text(
          getDisplay(animal),
        ),
        value: animal,
      ));
    }
  }

  void _onSelection(Animal animal) {
    setState(() {
      selected = animal;
      values = "Your Selected ${getDisplay(animal)}";
    });
  }

  String getDisplay(Animal animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                Slider(
                  value: _value,
                  onChanged: _onChanged,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: LinearProgressIndicator(
                      value: _value,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                ),
                Container(
                  child: CircularProgressIndicator(
                    value: _value,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(values),
                  ),
                ),
                PopupMenuButton<Animal>(
                    child: Icon(Icons.input),
                    initialValue: Animal.Cat,
                    onSelected: _onSelection,
                    itemBuilder: (BuildContext context) {
                      return items;
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
