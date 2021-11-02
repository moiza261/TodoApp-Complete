import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO App',
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ischecked = false;
  final List<String> todoList = <String>[
    "Task...",
    "Task...",
    "Task...",
    "Task..."
  ];

  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, right: 10),
              child: Text(
                "TO DO App",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, right: 20),
                    child: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Type Something Here....",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        todoList.add(input);
                      });
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(todoList[index]),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          margin: EdgeInsets.all(8.0),
                          elevation: 4,
                          child: ListTile(
                            title: Text(todoList[index]),
                            leading: Expanded(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.check_circle_outline))),
                            trailing: Wrap(
                              spacing: 0,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Edit Your List"),
                                            content: TextField(
                                              onChanged: (String value) {
                                                setState(() {
                                                  input = value;
                                                });
                                              },
                                            ),
                                            actions: [
                                              FlatButton(
                                                onPressed: () {
                                                  setState(() {
                                                    todoList[index] = input;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("EDIT"),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      todoList.removeAt(index);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
