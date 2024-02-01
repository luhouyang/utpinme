import 'package:flutter/material.dart';

class AuthUseCase extends ChangeNotifier {
  bool isLoading = false;

  void changeBool(bool boolean) {
    isLoading = boolean;
    notifyListeners();
  }
}
