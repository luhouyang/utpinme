import 'package:flutter/material.dart';

import '../public_holiday.dart';
import 'intern_table.dart';

class InternAcadCal extends StatelessWidget {
  const InternAcadCal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: const Color.fromARGB(0, 255, 255, 255),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                      //bottom: 5,
                    ),
                    child: SizedBox(
                      width: 380,
                      child: Row(
                        children: [
                          Text(
                            "Internship SIIP 2023",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Flexible(fit: FlexFit.tight, child: SizedBox()),
                        ],
                      ),
                    ),
                  ),
                  InternTable(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                      //bottom: 5,
                    ),
                    child: SizedBox(
                      width: 380,
                      child: Row(
                        children: [
                          Text(
                            "Public Holiday",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Flexible(fit: FlexFit.tight, child: SizedBox()),
                        ],
                      ),
                    ),
                  ),
                  PublicHolidayTable(),
                ]),
          )
        ],
      ),
    );
  }
}
