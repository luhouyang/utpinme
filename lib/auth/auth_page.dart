import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'auth_usecase.dart';
import 'login_page.dart';
import '../src/navbar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthUseCase(),
          )
        ],
        child: Consumer<AuthUseCase>(
          builder: (context, value, child) {
            return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const HomePage();
                  } else if (value.isLoading) {
                    {
                      debugPrint("Loading success");
                      return Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        size: 100,
                      ));
                    }
                  } else {
                    return const LoginPage();
                  }
                });
          },
        ),
      ),
    );
  }
}
