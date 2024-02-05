import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utp_in_me/pages/mini_app/uevent/animations/gradient_color_box_animation.dart';
import '../../entities/package_entity.dart';
import '../../entities/event_entity.dart';
import '../../utilities/utilities.dart';

class IndividualEventPage extends StatefulWidget {
  final EventEntity event;

  const IndividualEventPage({Key? key, required this.event}) : super(key: key);

  @override
  State<IndividualEventPage> createState() => _IndividualEventPageState();
}

class _IndividualEventPageState extends State<IndividualEventPage> {
  bool isEventDetailsVisible = true;
  bool showingSnackbar = false;

  int _carouselCurrent = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<PackageEntity> packageList = [];

    for (var data in widget.event.merchData) {
      PackageEntity packageEntity = PackageEntity.fromMap(data);
      packageList.add(packageEntity);
    }

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            isEventDetailsVisible
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: widget.event.bannerImage == null
                        ? GradientColorBoxAnimation(
                            height: MediaQuery.of(context).size.width,
                          )
                        : Image.memory(widget.event.bannerImage!),
                  )
                : Container(
                    child: widget.event.merchData.isEmpty
                        ? const Placeholder()
                        : Stack(
                            children: [
                              CarouselSlider.builder(
                                carouselController: _carouselController,
                                itemCount: widget.event.merchData.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    child: Center(
                                      child: Image.memory(
                                        widget.event.merchImages[index]!,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  viewportFraction: 1.0,
                                  height: MediaQuery.of(context).size.width,
                                  initialPage: 0,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 2),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(
                                      () {
                                        _carouselCurrent = index;
                                      },
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: MediaQuery.of(context).size.width * 0.5 -
                                    (widget.event.merchData.length * 16 / 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: widget.event.merchData
                                      .asMap()
                                      .entries
                                      .map(
                                    (entry) {
                                      return GestureDetector(
                                        onTap: () => _carouselController
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: const Color(0xffFFC21A)
                                                    .withOpacity(
                                                        _carouselCurrent ==
                                                                entry.key
                                                            ? 0.9
                                                            : 0.0)),
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black)
                                                .withOpacity(_carouselCurrent ==
                                                        entry.key
                                                    ? 0.9
                                                    : 0.4),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ],
                          ),
                  ),
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
                  color: Color.fromARGB(255, 4, 21, 49),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: const Color(0xff353F54),
                              elevation: isEventDetailsVisible ? 0 : 8,
                            ),
                            onPressed: () {
                              if (widget.event.merchImages.isNotEmpty) {
                                if (widget.event.merchImages[0] != null) {
                                  setState(() {
                                    isEventDetailsVisible = false;
                                  });
                                }
                              } else {
                                if (packageList.isEmpty && !showingSnackbar) {
                                  showingSnackbar = true;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                        content: const Text(
                                          "No Packages",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        action: SnackBarAction(
                                            label: 'OK',
                                            textColor: const Color(0xffFFC21A),
                                            onPressed: () {
                                              showingSnackbar = false;
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            }),
                                      ))
                                      .closed
                                      .then((value) {
                                    showingSnackbar = false;
                                  });
                                } else if (!showingSnackbar) {
                                  showingSnackbar = true;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text(
                                      "Loading Package",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    action: SnackBarAction(
                                        label: 'OK',
                                        textColor: const Color(0xffFFC21A),
                                        onPressed: () {
                                          showingSnackbar = false;
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                        }),
                                  )).closed
                                      .then((value) {
                                    showingSnackbar = false;
                                  });
                                }
                              }
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
                          )
                        ],
                      ),
                      isEventDetailsVisible
                          ? Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.event.title,
                                              style: MyTextStyles
                                                  .individualEventTitleTxt,
                                            ),
                                            Text(
                                              "Event by ${widget.event.organizer}",
                                              style: MyTextStyles
                                                  .individualEventNormalTxt,
                                            ),
                                          ],
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: InkWell(
                                            onHover: (value) {},
                                            onTap: () async {
                                              await launchUrl(Uri.parse(
                                                  "https://www.instagram.com/luhouyang?igsh=ajdnMW95ODJsMG4x"));
                                            },
                                            child: SvgPicture.asset(
                                              "assets/svg/instagram.svg",
                                              height: 40,
                                              width: 40,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Color(0xffFFC21A),
                                                      BlendMode.srcIn),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Description",
                                      style:
                                          MyTextStyles.individualEventHeaderTxt,
                                    ),
                                    Text(
                                      widget.event.description,
                                      style:
                                          MyTextStyles.individualEventNormalTxt,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Ticket",
                                      style:
                                          MyTextStyles.individualEventHeaderTxt,
                                    ),
                                    Text(
                                      "RM${widget.event.cost.toString()}",
                                      style:
                                          MyTextStyles.individualEventNormalTxt,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Contact No.",
                                      style:
                                          MyTextStyles.individualEventHeaderTxt,
                                    ),
                                    Text(
                                      widget.event.contactNo,
                                      style:
                                          MyTextStyles.individualEventNormalTxt,
                                    ),
                                    const SizedBox(height: 50),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: packageList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(8, 10, 8, 0),
                                    title: Text(
                                      packageList[index].packageName,
                                      style:
                                          MyTextStyles.individualEventTitleTxt,
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Description",
                                          style: MyTextStyles
                                              .individualEventHeaderTxt,
                                        ),
                                        Text(
                                          packageList[index].description,
                                          style: MyTextStyles
                                              .individualEventNormalTxt,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Price",
                                          style: MyTextStyles
                                              .individualEventHeaderTxt,
                                        ),
                                        Text(
                                          "RM${packageList[index].cost}",
                                          style: MyTextStyles
                                              .individualEventNormalTxt,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        if (index == packageList.length - 1)
                                          const SizedBox(
                                            height: 50,
                                          ),
                                      ],
                                    ),
                                  );
                                },
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
