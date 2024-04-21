import 'package:quick_eats/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:quick_eats/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:quick_eats/ui/views/home/home_view.dart';
import 'package:quick_eats/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:quick_eats/ui/views/auth/auth_view.dart';
import 'package:quick_eats/services/restaurant_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AuthView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: RestaurantService),
    LazySingleton(classType: SnackbarService),

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),

    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
