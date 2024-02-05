import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utp_in_me/pages/mini_app/uevent/usecases/event_usecase.dart';
import 'package:utp_in_me/pages/mini_app/uevent/widgets/manage_event_card.dart';

class ManageEventPage extends StatefulWidget {
  const ManageEventPage({super.key});

  @override
  State<ManageEventPage> createState() => _ManageEventPageState();
}

class _ManageEventPageState extends State<ManageEventPage> {
  List<String> organizerList = [
    "UTPCO",
    "SYNTECH",
    "ITBZ",
    "PETRA",
    "UPAG",
    "GDSC",
    "SK",
    "",
  ];

  String organizerSelection = "";

  bool verified = false;
  var passwordController = TextEditingController();
  Map<String, dynamic>? accessData;
  Future<void> _getPasswords() async {
    try {
      if (accessData == null) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('authorized')
            .doc('users')
            .get();
        accessData = Map.from(
            documentSnapshot.data() as Map<String, dynamic>)['accessData'];
      }

      if (accessData![organizerSelection] == passwordController.text) {
        setState(() {
          verified = true;
        });
      }

      debugPrint(accessData.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventUseCase>(
      builder: (context, eventUseCase, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 5,
                ),
                child: SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.blue[900],
                            ),
                            child: DropdownButton<String>(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 20, 0),
                                hint: organizerSelection == ""
                                    ? const Text(
                                        "Organizer",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        organizerSelection,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                items: organizerList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    organizerSelection = value!;
                                  });
                                }),
                          ),
                        ],
                      ),
                      const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      OutlinedButton(
                          onPressed: () async {
                            if (organizerSelection != "") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            organizerSelection,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Divider(),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          myTextField(
                                              controller: passwordController,
                                              label: "Password"),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {
                                              await _getPasswords();
                                              if (verified) {
                                                await eventUseCase
                                                    .searchEventFromFirestore(
                                                        organizerSelection)
                                                    .then((value) {
                                                  Navigator.of(context).pop();
                                                });
                                              } else {
                                                if (mounted) {
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                              content: Text(
                                                    "Incorrect Password",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  )));
                                                }
                                              }
                                              setState(() {
                                                passwordController.clear();
                                              });
                                            },
                                            child: const Center(
                                              child: Text(
                                                "Confirm",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ));
                                },
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              "   Fetch   ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const Divider(),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: eventUseCase.searchResults.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final entry = eventUseCase.searchResults[index];
                    return Column(
                      children: [
                        ManageEventCard(
                          event: entry,
                        ),
                      ],
                    );
                  }),
            ],
          ),
        );
      },
    );
  }

  Widget myTextField(
      {required TextEditingController controller, required String label}) {
    return TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          labelText: label,
        ));
  }
}
