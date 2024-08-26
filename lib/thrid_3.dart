import 'package:flutter/material.dart';

class Screen_3 extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  void _incrementCounter() {
    _counter.value = _counter.value + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nothing",
          style: TextStyle(color: Colors.white),
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
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (BuildContext ctx, int newValue, Widget? child) {
                return Text(
                  '$newValue',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            )
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
      builder: (BuildContext ctx1) {
        return Container(
          width: double.infinity,
          height: 250,
          color: Colors.deepPurple,
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Other options',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                ),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
