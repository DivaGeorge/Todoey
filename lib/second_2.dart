import 'package:flutter/material.dart';
import 'package:my_project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  String title;
  bool isDone;

  Task(this.title, this.isDone);
}

class Screen_2 extends StatefulWidget {
  const Screen_2({super.key});

  @override
  State<Screen_2> createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {
  List<Task> tasks = [
    Task('check mails', true),
    Task('Dinner with joy', true),
    Task('prepare speech', true),
    Task('shopping', true),
    Task('work out', true),
  ];

  final TextEditingController _textController = TextEditingController();

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  void addTask(String title) {
    setState(() {
      tasks.add(Task(title, false));
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Do List',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 13, 12, 0),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/plain.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        onTap: () {
                          print('hello');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        tileColor: Colors.white,
                        leading: Checkbox(
                          value: task.isDone,
                          onChanged: (value) {
                            toggleTaskCompletion(index);
                          },
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: task.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            color: Colors.white,
                            iconSize: 18,
                            onPressed: () {
                              deleteTask(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              hintText: 'Add a new task',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_textController.text.isNotEmpty) {
                              addTask(_textController.text);
                            }
                          },
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

signout(BuildContext ctx) async {
  final _sharedPrefs = await SharedPreferences.getInstance();
  await _sharedPrefs.clear();

  Navigator.of(ctx).pushAndRemoveUntil(
    MaterialPageRoute(builder: (ctx1) => LoginPage()),
    (route) => false,
  );
}
