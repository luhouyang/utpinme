import 'package:flutter/material.dart';

class ManageEventPage extends StatefulWidget {
  const ManageEventPage({super.key});

  @override
  State<ManageEventPage> createState() => _ManageEventPageState();
}

class _ManageEventPageState extends State<ManageEventPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Manage Event, edit, delete, timeline"),);
  }
}