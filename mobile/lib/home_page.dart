import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool isShow = false;

  void setToggle() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Colors.black26,
        ),
        body: Column(
          children: [
            const Text("Home Page"),
            ElevatedButton(
              onPressed: () => context.go('/notes'),
              child: const Text("Notes"),
            ),
            ElevatedButton(
                onPressed: setToggle, child: const Text("Toggle!!!")),
            if (isShow) const Text("Toggle")
          ],
        ),
      ),
    );
  }
}
