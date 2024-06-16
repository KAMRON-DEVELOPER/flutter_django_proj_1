import 'package:flutter/material.dart';
import 'package:mobile/counter.dart';
import 'package:provider/provider.dart';

class StateManagementWidget extends StatefulWidget {
  const StateManagementWidget({super.key});

  @override
  State<StateManagementWidget> createState() => _StateManagementWidgetState();
}

class _StateManagementWidgetState extends State<StateManagementWidget> {
  var count = Counter();

  @override
  void initState() {
    super.initState();
    print(count.getCount);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
        backgroundColor: Colors.black26,
      ),
      body: Center(
        child: Text("count is ${context.watch<Counter>().count}"),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    ));
  }
}
