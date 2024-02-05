import 'package:flutter/material.dart';
import 'package:utp_in_me/pages/mini_app/uevent/widgets/manage_event_card.dart';

class ManageEventPage extends StatefulWidget {
  const ManageEventPage({super.key});

  @override
  State<ManageEventPage> createState() => _ManageEventPageState();
}

class _ManageEventPageState extends State<ManageEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: ListView(
          children: [
            const ManageEventCard(),
            const ManageEventCard(),
            const ManageEventCard(),
            const ManageEventCard(),
            const ManageEventCard(),
            const ManageEventCard(),
          ],
        ),
      )
    ]));
  }
}