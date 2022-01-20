import 'package:flutter/material.dart';
import 'package:list_project/list_screen.dart';

class ListApplication extends StatelessWidget {
  const ListApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/list_screen',
      routes: {
        '/list_screen': (context) => const ListScreen(),
      },
    );
  }
}
