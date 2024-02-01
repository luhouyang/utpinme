import 'package:flutter/material.dart';
import 'up_section_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: UpSectionHome(),
    ));
  }
}
