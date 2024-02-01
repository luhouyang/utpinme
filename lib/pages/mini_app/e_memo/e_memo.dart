import 'package:flutter/material.dart';
import 'e_memo_advisor.dart';
import 'e_memo_approval.dart';
import 'e_memo_myrequest.dart';
import 'new_request_services/new_request.dart';

class Ememo extends StatelessWidget {
  const Ememo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            //toolbarHeight: 70,
            title: const Text('eMemo'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  //icon: Icon(Icons.date_range_rounded),
                  text: "My Request",
                ),
                Tab(
                  //icon: Icon(Icons.query_stats_rounded),
                  text: "Advisor",
                ),
                Tab(
                  //icon: Icon(Icons.query_stats_rounded),
                  text: "Approval",
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: (() {}),
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              EMemoMyRequest(),
              EMemoAdvisor(),
              EMemoApproval(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Create new request",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmemoNewRequest()));
            },
            child: const Icon(Icons.add_rounded),
          ),
        ));
  }
}
