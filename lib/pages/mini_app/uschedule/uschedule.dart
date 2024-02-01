import 'package:flutter/material.dart';
import 'uschedule_course.dart';
import 'uschedule_exam.dart';

class USchedule extends StatelessWidget {
  const USchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('USchedule'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  // icon: Icon(Icons.book_rounded),
                  text: "Course",
                ),
                Tab(
                  //icon: Icon(Icons.bookmark_rounded),
                  text: "Exam",
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
            physics: NeverScrollableScrollPhysics(),
            children: [
              UScheduleCourse(),
              UScheduleExam(),
            ],
          ),
        ));
  }
}
