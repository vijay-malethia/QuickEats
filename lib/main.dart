import 'package:flutter/material.dart';
import 'package:quick_eats/app/app.bottomsheets.dart';
import 'package:quick_eats/app/app.dialogs.dart';
import 'package:quick_eats/app/app.locator.dart';
import 'package:quick_eats/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'services/snackbar_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  setupSnackbarUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
