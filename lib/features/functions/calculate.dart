import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unavialable/features/functions/string_manupulation.dart';
import 'package:unavialable/presentation/provider/provider.dart';

/*27MZ*/
int _caloryDecrease = 0;
int _fatDecrease = 0;
int _carbDecrease = 0;
int _proteinDecrease = 0;

Future<void> calculateCaloriesDecrease(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final now = DateTime.now();
  String formattedDay = DateFormat('dd').format(now);

  _caloryDecrease = prefs.getInt("allCalory") ?? 0;
  _fatDecrease = prefs.getInt("allFat") ?? 0;
  _carbDecrease = prefs.getInt("allCarb") ?? 0;
  _proteinDecrease = prefs.getInt("allProtein") ?? 0;

  List<String> day = prefs.getStringList("ls_days") ?? [];
  List<String> lsCalories = prefs.getStringList("ls_calories") ?? [];

  for (int i = 0; i < day.length; i++) {
    List<double> strToInt = stringToInt(lsCalories[i]);
    if (formattedDay == day[i]) {
      _caloryDecrease -= strToInt[0].toInt();
      _fatDecrease -= strToInt[1].toInt();
      _proteinDecrease -= strToInt[2].toInt();
      _carbDecrease -= strToInt[3].toInt();
    }
  }
  print(
      "${prefs.getInt("allCalory")} +++ ${prefs.getInt("allFat")} +++ ${prefs.getInt("allCarb")} +++ ${prefs.getInt("allProtein")}");
  print(
      "$_caloryDecrease --- $_fatDecrease --- $_carbDecrease --- $_proteinDecrease");

  if (_caloryDecrease <= 0) {
    await prefs.setBool("plan_done", true);
    Provider.of<ProviderClass>(context, listen: false).initPlan();
    print("Kunlik plan ${prefs.getInt("allCalory")}");

    _caloryDecrease = -1;
    _fatDecrease = -1;
    _carbDecrease = -1;
    _proteinDecrease = -1;

    print("_caloryDecrease: $_caloryDecrease");

    prefs.setInt("ccc", _caloryDecrease);
    prefs.setInt("fff", _fatDecrease);
    prefs.setInt("car", _carbDecrease);
    prefs.setInt("ppp", _proteinDecrease);
  } else {
    print("***************************************");
    prefs.setInt("ccc", _caloryDecrease);
    prefs.setInt("fff", _fatDecrease);
    prefs.setInt("car", _carbDecrease);
    prefs.setInt("ppp", _proteinDecrease);
  }

  print("ccc: ${prefs.getInt("ccc")}");
}

//----------------------------------------------------------------
List<String> _saveItemsImages = [];
List<String> _saveItemsCalories = [];
List<String> _saveItemsDateTime = [];
List<String> _saveItemsOnlyDay = [];

Future<void> saveApiDataMemory(
  String newImages,
  String newCalories,
  String newDates,
  String newDay,
  BuildContext context,
) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  _saveItemsImages = prefs.getStringList("ls_images") ?? [];
  _saveItemsCalories = prefs.getStringList("ls_calories") ?? [];
  _saveItemsDateTime = prefs.getStringList("ls_dates") ?? [];
  _saveItemsOnlyDay = prefs.getStringList("ls_days") ?? [];
  print(
    "Oldin: $_saveItemsImages ||| $_saveItemsCalories ||| $_saveItemsDateTime ||| $_saveItemsOnlyDay",
  );
  _saveItemsImages.add(newImages);
  _saveItemsCalories.add(newCalories);
  _saveItemsDateTime.add(newDates);
  _saveItemsOnlyDay.add(newDay);
  print(
    "Keyin: $_saveItemsImages ||| $_saveItemsCalories ||| $_saveItemsDateTime ||| $_saveItemsOnlyDay",
  );

  Provider.of<ProviderClass>(context, listen: false).initSavedList(
    _saveItemsImages,
    _saveItemsCalories,
    _saveItemsDateTime,
    _saveItemsOnlyDay,
  );

  await prefs.setStringList("ls_images", _saveItemsImages);
  await prefs.setStringList("ls_calories", _saveItemsCalories);
  await prefs.setStringList("ls_dates", _saveItemsDateTime);
  await prefs.setStringList("ls_days", _saveItemsOnlyDay);
}
