import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utp_in_me/pages/mini_app/uevent/pages/admin_access/manage_event_page.dart';
import 'pages/admin_access/add_event.dart';
import 'pages/normal_access/event_page.dart';
import 'pages/normal_access/search_page.dart';
import 'pages/normal_access/uevent_help_page.dart';
import 'pages/normal_access/uevent_my_ticket.dart';
import 'uevent_product_page.dart';
import 'package:animations/animations.dart';
import 'usecases/event_usecase.dart';
import 'usecases/navigation_usecase.dart';

class UEvent extends StatelessWidget {
  const UEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => NavigationUseCase(),
      ),
      ChangeNotifierProvider(
        create: (context) => EventUseCase(),
      ),
    ], child: const UEventUI());
  }
}

/// Flutter code sample for [NavigationDrawer].

class UEventUI extends StatefulWidget {
  const UEventUI({super.key});

  @override
  State<UEventUI> createState() => _UEventUIState();
}

class _UEventUIState extends State<UEventUI> {
  final user = FirebaseAuth.instance.currentUser;
  List<String> authorizedUsers = [];
  bool canAddEvent = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  var _selectedIndex = 0;
  final List<Widget> _windgetOption = <Widget>[
    const EventPage(),
    const SearchPage(),
    //const UEventProduct(),
    const UEventMyTicket(),
    const UEventHelp(),
  ];

  Future<void> _getAuthorizedUsers() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('authorized')
          .doc('users')
          .get();
      List<dynamic> data =
          Map.from(documentSnapshot.data() as Map<String, dynamic>)['email'];
      authorizedUsers = data.map((e) => e.toString()).toList();

      if (authorizedUsers.contains(user?.email)) {
        setState(() {
          canAddEvent = true;
          _windgetOption.insert(3, const AddEvent());
          _windgetOption.insert(4, const ManageEventPage());
        });
      }

      debugPrint(authorizedUsers.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    _getAuthorizedUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 3,
        scrolledUnderElevation: 3,
        title: const Text('UEvent'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: openDrawer,
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: _windgetOption.elementAt(_selectedIndex),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: (i) {
          setState(() => _selectedIndex = i);
          Navigator.pop(context);
        },
        selectedIndex: _selectedIndex,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 13, 10, 13),
                child: Text(
                  'Menu',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 1,
                      left: 5,
                      right: 5,
                      bottom: 1,
                    ),
                    child: Text(
                      "BETA",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ))
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const NavigationDrawerDestination(
            label: Text("New Events"),
            icon: Icon(Icons.event_note_outlined),
            selectedIcon: Icon(Icons.event_note_rounded),
          ),
          const NavigationDrawerDestination(
            label: Text("Search"),
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search_rounded),
          ),
          /*const NavigationDrawerDestination(
            label: Text("Events"),
            icon: Icon(Icons.event_note_outlined),
            selectedIcon: Icon(Icons.event_note_rounded),
          ),*/
          const NavigationDrawerDestination(
            label: Text("My Ticket"),
            icon: Icon(Icons.local_activity_outlined),
            selectedIcon: Icon(Icons.local_activity_rounded),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
            child: Divider(),
          ),
          if (canAddEvent)
            const NavigationDrawerDestination(
              label: Text("Add Event"),
              icon: Icon(Icons.add_circle_outline_outlined),
              selectedIcon: Icon(Icons.add_circle_outline_rounded),
            ),
          if (canAddEvent)
            const NavigationDrawerDestination(
              label: Text("Manage Event"),
              icon: Icon(Icons.settings),
              selectedIcon: Icon(Icons.settings_applications_sharp),
            ),
          if (canAddEvent)
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
              child: Divider(),
            ),
          const NavigationDrawerDestination(
            label: Text("About/Help"),
            icon: Icon(Icons.help_outline),
            selectedIcon: Icon(Icons.help_rounded),
          ),
        ],
      ),
    );
  }
}
