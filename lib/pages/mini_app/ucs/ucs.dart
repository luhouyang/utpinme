import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'create_case_data.dart';
import 'knowledge_hub.dart';
import 'my_support.dart';

class Ucs extends StatelessWidget {
  Ucs({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            elevation: 3,
            title: const Text('Unified Customer Services'),
            bottom: const TabBar(
              //isScrollable: true,

              tabs: [
                Tab(
                  text: "My Case",
                ),
                Tab(
                  text: "Knowledge Base",
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Create a case",
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => const Dialog.fullscreen(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Expanded(child: CreateCaseUcs())],
                ),
              ),
            ),
            child: const Icon(Icons.add_rounded),
          ),
          body: TabBarView(
            children: [
              MySupport(),
              KnowledgeHub(),
            ],
          ),
        ));
  }
}
