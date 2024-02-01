import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../animations/gradient_color_box_animation.dart';
import '../entities/event_entity.dart';
import '../pages/individual_event_page.dart';

class EventCard extends StatelessWidget {
  final String imgUrl;
  final EventEntity event;
  const EventCard({super.key, required this.event, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IndividualEventPage(
                    imgUrl: imgUrl,
                    event: event,
                  )),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1)
            ], borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: event.bannerImage == null
                  ? const GradientColorBoxAnimation()
                  : Image.memory(event.bannerImage!),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            event.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              Text(event.organizer),
              const Text(
                " · ",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              Text(DateFormat("dd-MM-yyyy").format(event.dateTime)),
            ],
          )
        ],
      ),
    );
  }
}
