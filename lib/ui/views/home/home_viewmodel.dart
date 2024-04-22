import 'dart:convert';
import 'dart:io';

//
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/foundation.dart';

//
import 'package:quick_eats/app/app.dialogs.dart';
import 'package:quick_eats/app/app.locator.dart';
import 'package:quick_eats/services/restaurant_service.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final RestaurantService _restaurantService = locator<RestaurantService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  int starRating = -1;

  // Select star for restaurant rating
  void onStarRatingChange(int value) {
    starRating = value + 1;
    rebuildUi();
  }

  void addStar(String id, List ratings) {
    ratings.forEach((element) {
      if (element['id'].toString() == id) {
        (element['averageRating'] as List).add(starRating);
      }
    });
  }

  // To show dialog for rating
  void showDialog(int id) async {
    var res = await _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      data: ratingList,
      description: id.toString(),
    );
    if (res!.confirmed) {
      showSnackBar();
      readJsonFile();
      rebuildUi();
    }
  }

  // To show snackbar when rating is submitted
  void showSnackBar() {
    _snackbarService.showSnackbar(
      message: 'Thankyou for your feedback! Your rating has been updated',
      duration: const Duration(seconds: 2),
    );
  }

  // Get all restaurants
  List restaurantList = [];
  List ratingList = [];
  void getAllRestaurants() async {
    setBusy(true);
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}localJson.json');
      bool doesExist = await file.exists();
      var res = await _restaurantService.getRestaurants();
      if (res.statusCode == 200) {
        restaurantList = jsonDecode(res.data);
        if (!doesExist) await saveJsonToLocal(restaurants: restaurantList);
        ratingList = await readJsonFile();
        notifyListeners();
      }
    } on Error catch (e) {
      debugPrint(e.toString());
    } finally {
      setBusy(false);
    }
  }

  // Save json to local
  Future<void> saveJsonToLocal({required List restaurants}) async {
    List<Map> json = [];
    for (var restaurant in restaurants) {
      json.add({
        'id': restaurant['id'],
        'averageRating': [],
      });
    }
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}localJson.json');
    file.writeAsString(jsonEncode(json));
  }

  // Save rating to local
  saveRating(List json) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}localJson.json');
    file.writeAsString(jsonEncode(json));
  }

  // Use this function to read json data from local file
  static Future<List> readJsonFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var input = await File('${directory.path}localJson.json').readAsString();
    List map = jsonDecode(input);
    return map;
  }

  // This function use to calculate average of rating
  int calCulateRating(index) {
    double total = 0;
    for (var i = 0; i < ratingList[index]['averageRating'].length; i++) {
      total = total + ratingList[index]['averageRating'][i];
    }
    if (total == 0) {
      return 0;
    }
    return (total / ratingList[index]['averageRating'].length).round();
  }
}
