import 'package:flutter/material.dart';
import 'package:todo_firebase/widget/to_do_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _titlecontroler = TextEditingController();
  final _descontroler = TextEditingController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ToDoListWidget(),
      Container(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.7),
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: "Todo"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Compeleted"),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext contex) {
            return AlertDialog(
              title: const Text('Add Todo'),
              content: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(labelText: 'Title'),
                          controller: _titlecontroler,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(labelText: 'Description'),
                          controller: _descontroler,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
              ),
              actions: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text('Add'),
                  ),
                ),
              ],
            );
          },
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Icon(Icons.add),
      ),
    );
  }
}
