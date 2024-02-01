import 'package:flutter/material.dart';
import 'fdug_pack/fdug_acad_cal.dart';
import 'intern_pack/intern_acad_cal.dart';
import 'pg_pack/pg_acad_cal.dart';

class AcadCal extends StatelessWidget {
  const AcadCal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Academic Calendar'),
            elevation: 3,
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: "Foundation, Undergraduate & MSC",
                ),
                Tab(
                  text: "Postgraduate",
                ),
                Tab(
                  text: "Internship (SIIP)",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              FdUgAcadCal(),
              PgAcadCal(),
              InternAcadCal(),
            ],
          ),
        ));
  }
}
