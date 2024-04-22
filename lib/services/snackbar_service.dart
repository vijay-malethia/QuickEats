import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

//
import '/app/app.locator.dart';

enum SnackbarType { success }

// SnackBar configuration
void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
        backgroundColor: const Color(0xff31449B),
        textColor: Colors.white,
        snackPosition: SnackPosition.TOP,
        maxWidth: 700,
        borderRadius: 10,
        margin: const EdgeInsets.all(10)),
  );
}
