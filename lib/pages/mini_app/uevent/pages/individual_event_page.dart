import 'package:flutter/material.dart';
import '../entities/event_entity.dart';
import '../utilities/utilities.dart';

class IndividualEventPage extends StatefulWidget {
  final String imgUrl;
  final EventEntity event;

  const IndividualEventPage(
      {Key? key, required this.event, required this.imgUrl})
      : super(key: key);

  @override
  //State<EventPage> createState() => _EventPageState();
  State<IndividualEventPage> createState() => _IndividualEventPageState();
  //_IndividualEventPageState createState() => _IndividualEventPageState();
}

class _IndividualEventPageState extends State<IndividualEventPage> {
  bool isEventDetailsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            isEventDetailsVisible
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: widget.event.bannerImage == null
                        ? const Placeholder()
                        : Image.memory(widget.event
                            .bannerImage!), //Image.asset(widget.imgUrl, fit: BoxFit.cover),
                  )
                : Container(
                    height: MediaQuery.of(context).size.width,
                    child: widget.event.merchData.isEmpty
                        ? const Placeholder()
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: widget.event.merchData.length,
                            itemBuilder: (context, index) {
                              return Image.memory(
                                  widget.event.merchImages[index]!);
                            },
                          )),
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                style: IconButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color(0xffFFC21A),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.95,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.055,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff353F54),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: const Color(0xff353F54),
                              elevation: isEventDetailsVisible ? 8 : 0,
                            ),
                            onPressed: () {
                              setState(() {
                                isEventDetailsVisible = true;
                                false; // Reset other button state
                              });
                            },
                            child: Text(
                              "Event Details",
                              style: TextStyle(
                                color: isEventDetailsVisible
                                    ? Colors.yellow
                                    : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: const Color(0xff353F54),
                              elevation: isEventDetailsVisible ? 0 : 8,
                            ),
                            onPressed: () {
                              setState(() {
                                isEventDetailsVisible = false;
                              });
                            },
                            child: Text(
                              "Packages",
                              style: TextStyle(
                                color: isEventDetailsVisible
                                    ? Colors.white
                                    : Colors.yellow,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                      Visibility(
                        visible: isEventDetailsVisible,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.event.title,
                              style: MyTextStyles.individualEventTitleTxt,
                            ),
                            Text(
                              "Event by ${widget.event.organizer}",
                              style: MyTextStyles.individualEventNormalTxt,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Description",
                              style: MyTextStyles.individualEventHeaderTxt,
                            ),
                            Text(
                              widget.event.description,
                              style: MyTextStyles.individualEventNormalTxt,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Category",
                              style: MyTextStyles.individualEventHeaderTxt,
                            ),
                            /*Text(
                              widget.event.tags.toString(),
                              style: MyTextStyles.individualEventNormalTxt,
                            ),*/
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !isEventDetailsVisible,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                color: Colors
                                    .blue, // Change the text color to blue
                                fontSize: 20, // Change the font size
                                fontWeight:
                                    FontWeight.bold, // Make the text bold
                                // Add more styles as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
