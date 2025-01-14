import 'package:flutter/material.dart';

class MoreNotification extends StatelessWidget {
  const MoreNotification({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Icon(
                                    Icons.mail_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    "Dr Phil Considine, Director of Strathclyde Executive Education and Development, Strathclyde Business School, University of Strathclyde",
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("11 September 2023"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    "Visit by University Nottingham Malaysia (UNM)",
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("10 September 2023"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    "UTP’s CONVORIDE 2023 IS NOW OPEN FOR REGISTRATION!",
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("09 September 2023"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    "UTP's CONVORIDE ROUTES",
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("08 September 2023"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    "Delving Beyond Hydrocarbons",
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("07 September 2023"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    "UTP Student Jocelyn Teh Shuang Ru Emerges as Champion in Intel AI Design Competition",
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("06 September 2023"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    "UTP and Petroleum Technology Development Fund Strengthen Partnership through Postgraduate Sponsorship Programmes",
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("05 September 2023"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
      ]),
    );
  }
}
