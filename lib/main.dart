import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'views/tasks/tasks.dart';

void main() => runApp(const MyTaskApp());

class MyTaskApp extends StatelessWidget {
  const MyTaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTasks',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      home: const Tasks(),
    );
  }
}
