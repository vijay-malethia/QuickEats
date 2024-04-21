import 'package:stacked/stacked.dart';

//
import 'package:quick_eats/app/app.locator.dart';
import 'package:quick_eats/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:quick_eats/api/http.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    initDio();
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithAuthView();
  }
}
