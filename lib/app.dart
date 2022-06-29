import 'package:flutter/material.dart';
import 'package:learn_shared_preferance/pages/home_page.dart';

class LearnDb extends StatelessWidget {
  const LearnDb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}