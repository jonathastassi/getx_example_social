import 'package:flutter/material.dart';
import 'package:getx_example_social/presentation/widgets/drawer_menu.dart';

class CounterWithSetState extends StatefulWidget {
  static final String route = '/counter-with-set-state';

  const CounterWithSetState({ Key? key }) : super(key: key);

  @override
  _CounterWithSetStateState createState() => _CounterWithSetStateState();
}

class _CounterWithSetStateState extends State<CounterWithSetState> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter with setState'),
      ),
      body: Center(
        child: Text(counter.toString()),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: 1,
              onPressed: _increment,
              child: Icon(
                Icons.add,
              ),
            ),
            FloatingActionButton(
              heroTag: 2,
              onPressed: _decrement,
              child: Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}