import 'package:flutter/material.dart';

class screen_3 extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  void _incrementCounter() {
    _counter.value = _counter.value + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.white,
          child: Text("Nothing"),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You clicked the button this many times"),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (BuildContext ctx, int newValue, Widget? child) {
                  return Text(
                    '$newValue',
                    style: Theme.of(context).textTheme.headline4,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          _showBottomSheet(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showBottomSheet(BuildContext ctx) async {
    await showModalBottomSheet(
        context: ctx,
        builder: (ctx1) {
          return Container(
            width: double.infinity,
            height: 250,
            color: Colors.deepPurple,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'other options',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  child: Text('Close'),
                ),
              ],
            ),
          );
        });
  }
}
