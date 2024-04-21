import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:fluttertoast/fluttertoast.dart';

//
import 'package:quick_eats/app/app.locator.dart';
import 'package:quick_eats/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final NavigationService _navigationService = locator<NavigationService>();

  // Check form is valid or not
  void isFormValid() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Pleae fill the form",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
