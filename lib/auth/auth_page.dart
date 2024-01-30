import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utp_in_me/auth/login_page.dart';
import 'package:utp_in_me/main.dart';
import 'package:utp_in_me/src/navbar.dart';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class AuthPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const AuthPage({super.key, required this.navigatorKey});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static final Config config = Config(
    tenant: 'f8cdef31-a31e-4b4a-93e4-5f571e91255a',
    clientId: 'ddcc2702-dd8b-4a07-848b-cf6054a32fa3',
    scope: 'openid profile offline_access',
    navigatorKey: navigatorKey,
    loader: const Center(child: CircularProgressIndicator()),
    appBar: AppBar(
      title: const Text('AAD OAuth | Microsoft'),
    ),
  );
  final AadOAuth oauth = AadOAuth(config);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text(
          "AzureAD OAuth | Microsoft Auth",
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.launch),
            title: const Text(
                'Login${kIsWeb ? ' (web popup)' : ' using Microsoft'}'),
            onTap: () {
              login(false);
            },
          ),
          if (kIsWeb)
            ListTile(
              leading: const Icon(Icons.launch),
              title: const Text('Login (web redirect)'),
              onTap: () {
                login(true);
              },
            ),
          const Divider(
            height: 2,
          ),
          ListTile(
            leading: const Icon(Icons.data_array),
            title: const Text('HasCachedAccountInformation'),
            onTap: () => hasCachedAccountInformation(),
          ),
          const Divider(
            height: 2,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              logout();
            },
          ),
        ],
      ),
    );
    /*return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          }),
    );*/
  }

  void toHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(bool redirect) async {
    config.webUseRedirect = redirect;
    final result = await oauth.login();
    result.fold(
      (l) => showError(l.toString()),
      (r) => showMessage('Logged in successfully, your access token: $r'),
    );
    var accessToken = await oauth.getAccessToken();
    if (accessToken != null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(accessToken)));
      toHomePage(); // navigate route to home page
    }
  }

  void hasCachedAccountInformation() async {
    var hasCachedAccountInformation = await oauth.hasCachedAccountInformation;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('HasCachedAccountInformation: $hasCachedAccountInformation'),
      ),
    );
    if (hasCachedAccountInformation) {
      toHomePage(); // navigate route to home page
    }
  }

  void logout() async {
    await oauth.logout();
    showMessage('Logged out');
  }
}
