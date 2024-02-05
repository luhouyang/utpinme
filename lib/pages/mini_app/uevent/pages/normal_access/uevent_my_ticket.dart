import 'package:flutter/material.dart';
import 'package:utp_in_me/pages/mini_app/uevent/widgets/ticket_card.dart';

class UEventMyTicket extends StatelessWidget {
  const UEventMyTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 5,
        ),
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: 'Date Filter',
                  ),
                ),
              ),
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 10,
                    right: 5,
                    bottom: 5,
                  ),
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month_rounded)))),
            ],
          ),
        ),
      ),
      const Divider(),
      Expanded(
        child: ListView(
          children: [
            const TicketCard(),
            const TicketCard(),
            const TicketCard(),
            const TicketCard(),
            const TicketCard(),
          ],
        ),
      )
    ]));
  }
}
