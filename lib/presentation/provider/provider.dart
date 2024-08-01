import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:unavialable/features/functions/prefs.dart';
import 'package:unavialable/features/functions/string_manupulation.dart';

class ProviderClass extends ChangeNotifier {
  int activeIndex = 0;

  void changeIndex(int newIndex) {
    activeIndex = newIndex;
    notifyListeners();
  }

  // bool dotVisible1 = false;
  // bool dotVisible2 = false;
  // void changeDotVisible() {
  //   dotVisible1 = !dotVisible1;
  //   dotVisible2 = !dotVisible2;
  //   notifyListeners();
  // }

  FontWeight todayWeight = FontWeight.normal;
  FontWeight dayWeight = FontWeight.normal;
  void changeWeight(int number) {
    if (number == 1) {
      todayWeight = FontWeight.bold;
      dayWeight = FontWeight.normal;
    } else {
      todayWeight = FontWeight.normal;
      dayWeight = FontWeight.bold;
    }
    notifyListeners();
  }

  String dropdownValue = "Kecha";
  void changeDropDownValue(String newValue) {
    dropdownValue = newValue;
    notifyListeners();
  }

  bool lastIndex = false;
  void isLastPage(int index) {
    lastIndex = index == 3 ? true : false;
  }

// ========= Gender ==========
  bool isClicked1 = false;
  bool isClicked2 = false;
  void changeClick(int value) {
    if (value == 1) {
      isClicked1 = !isClicked1;
      isClicked2 = false;
    } else {
      isClicked2 = !isClicked2;
      isClicked1 = false;
    }
    notifyListeners();
  }

// ========= Train ==========
  bool times1 = false;
  bool times2 = false;
  bool times3 = false;
  void selectedTimes(int value) {
    if (value == 1) {
      times1 = !times1;
      times2 = false;
      times3 = false;
    } else if (value == 2) {
      times2 = !times2;
      times1 = false;
      times3 = false;
    } else {
      times3 = !times3;
      times2 = false;
      times1 = false;
    }
    notifyListeners();
  }

// ========= Your Goal ==========
  bool goal1 = false;
  bool goal2 = false;
  bool goal3 = false;
  void selectedGoal(int value) {
    if (value == 1) {
      goal1 = !goal1;
      goal2 = false;
      goal3 = false;
    } else if (value == 2) {
      goal2 = !goal2;
      goal1 = false;
      goal3 = false;
    } else {
      goal3 = !goal3;
      goal2 = false;
      goal1 = false;
    }
    notifyListeners();
  }

// ========= Number picker(vazn) ==========
  int defaultWeight = 60;
  void onChangeWeight(int value) {
    defaultWeight = value;
    notifyListeners();
  }

// ========= Number picker(bo'y) ==========
  int defaultTall = 120;
  void onChangeTall(int value) {
    defaultTall = value;
    notifyListeners();
  }

// ========= Date Picker ==========
  String date = "2001-04-09";
  void changeDate(DateTime value) {
    String dateToString = value.toString();
    date = dateToString.substring(0, 10);
    notifyListeners();
  }

// ========= Check ==========
  bool isTrue = false;
  void checkTrue(bool value) async {
    isTrue = value;
    notifyListeners();
  }

// ========= FILE PICKER ==========
  File? image;
  void initFile(File? newFile) {
    image = newFile;
    notifyListeners();
  }

// ========= Response text ==========

  String path = "";
  String calory = "";
  String dateTime = "";
  String formatDay = "";

  void initSavedText(
    String newPath,
    String newCalory,
    String newDate,
    String newFormatDay,
  ) {
    path = newPath;
    calory = newCalory;
    dateTime = newDate;
    formatDay = newFormatDay;

    notifyListeners();
  }

  int dailyCalory = 0;
  double oqsilCalory = 0.0;
  double yogCalory = 0.0;
  double uglevodCalory = 0.0;
  void calculateDailyCalory() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
//=============================================================
    DateFormat format = DateFormat("yyyy-dd-MM");
    DateTime now = DateTime.now();
    DateTime birthDate = format.parse(pref.getString("dob")!);
    DateTime currentDate = format.parse(format.format(now));

    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    // ageTT = age;
//=================================================================
    double bmr = 0.0;
    if (pref.getString("gender") == "Erkak") {
      bmr = 88.362 +
          (13.397 * pref.getInt("weight")!) +
          (4.799 * pref.getInt("tall")!) -
          (5.677 * age);
    } else {
      bmr = 447.593 +
          (9.247 * pref.getInt("weight")!) +
          (3.098 * pref.getInt("tall")!) -
          (4.330 * age);
    }
//=================================================================
    double tdee = 0.0;
    if (pref.getString("plan")! == "0-2") {
      tdee = bmr * 1.2;
    } else if (pref.getString("plan")! == "3-5") {
      tdee = bmr * 1.55;
    } else {
      tdee = bmr * 1.725;
    }
//==================================================================
    double tdee_goal = 0.0;
    if (pref.getString("goal")! == "Vazn olish") {
      tdee_goal = tdee + (500 * 1 / 1);
    } else if (pref.getString("goal")! == "O'z holida saqlash") {
      tdee_goal = tdee;
    } else {
      tdee_goal = tdee - (500 * 1 / 1);
    }
    dailyCalory = tdee_goal.toInt();
//==================================================================
    oqsilCalory = (1 * (pref.getInt("weight")!) * 4) / 4;
    yogCalory = (tdee_goal * 0.25) / 9;
    uglevodCalory = (tdee_goal - oqsilCalory - yogCalory) / 4;
//=============================== barchasi saqlab olish =================================
    SharedPreferencesClass.saveAllCalory(
      dailyCalory,
      yogCalory.toInt(),
      uglevodCalory.toInt(),
      oqsilCalory.toInt(),
    );

    notifyListeners();
  }

  ProviderClass() {
    initLists();
    // initCalory();
    // newListInit();
    initQolganCaloriyalar();
  }

//++++++++++++++++++++++++++++++++++++
  int caloryDecrease = 0;
  int fatDecrease = 0;
  int proteinDecrease = 0;
  int carbDecrease = 0;

  void initLists() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    caloryDecrease = pref.getInt("allCalory") ?? 0;
    fatDecrease = pref.getInt("allFat") ?? 0;
    carbDecrease = pref.getInt("allCarb") ?? 0;
    proteinDecrease = pref.getInt("allProtein") ?? 0;

    notifyListeners();
  }

  // ========== Bu yerda yangi qo'shilgan elementlar ==========
  // ============== UI da ko'rinishi ta'minlanadi =============
  // List<String> imageList = [];
  // List<String> caloryList = [];

  // void newListInit(
  //   String newImages,
  //   String newCalories,
  //   String newDates,
  //   String newDay,
  // ) async {
  //   saveItemsImages.add(newImages);
  //   saveItemsCalories.add(newCalories);
  //   saveItemsDateTime.add(newDates);
  //   saveItemsOnlyDay.add(newDay);
  //   //===============================

  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.setStringList("ls_images", saveItemsImages);
  //   await pref.setStringList("ls_calories", saveItemsCalories);
  //   await pref.setStringList("ls_dates", saveItemsDateTime);
  //   await pref.setStringList("ls_days", saveItemsOnlyDay);

  // final now = DateTime.now();
  // String formattedDay = DateFormat('dd').format(now);
  // List<String> day = pref.getStringList("ls_days") ?? [];
  // List<String> lsCalories = pref.getStringList("ls_calories") ?? [];

  // for (int i = 0; i < day.length; i++) {
  //   List<double> strToInt = stringToInt(lsCalories[i]);
  //   if (formattedDay == day[i]) {
  //     caloryDecrease -= strToInt[0].toInt();
  //     fatDecrease -= strToInt[1].toInt();
  //     proteinDecrease -= strToInt[2].toInt();
  //     carbDecrease -= strToInt[3].toInt();
  //   }
  // }

  // pref.setInt("ccc", caloryDecrease);
  // pref.setInt("fff", fatDecrease);
  // pref.setInt("car", carbDecrease);
  // pref.setInt("ppp", proteinDecrease);

  // print(pref.getStringList("ls_images"));
  // print(pref.getStringList("ls_calories"));
  // print(pref.getStringList("ls_days"));
  // print("day = $day");
  // print(pref.getStringList("$saveItemsOnlyDay"));

  //   notifyListeners();
  // }

  String day = DateFormat('dd').format(DateTime.now());
  void isDayChange() {
    day = DateFormat('dd').format(DateTime.now());
    notifyListeners();
  }

  Future<void> a() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final now = DateTime.now();
    String formattedDay = DateFormat('dd').format(now);
    List<String> day = pref.getStringList("ls_days") ?? [];
    List<String> lsCalories = pref.getStringList("ls_calories") ?? [];

    for (int i = 0; i < day.length; i++) {
      List<double> strToInt = stringToInt(lsCalories[i]);
      if (formattedDay == day[i]) {
        caloryDecrease -= strToInt[0].toInt();
        fatDecrease -= strToInt[1].toInt();
        proteinDecrease -= strToInt[2].toInt();
        carbDecrease -= strToInt[3].toInt();
      }
    }

    pref.setInt("ccc", caloryDecrease);
    pref.setInt("fff", fatDecrease);
    pref.setInt("car", carbDecrease);
    pref.setInt("ppp", proteinDecrease);
  }

  List<String> saveItemsImages = [];
  List<String> saveItemsCalories = [];
  List<String> saveItemsDateTime = [];
  List<String> saveItemsOnlyDay = [];

//=================== Saved Items ==================
  void initSavedList(
    List<String> path,
    List<String> calory,
    List<String> dateTime,
    List<String> day,
  ) {
    saveItemsImages = path;
    saveItemsCalories = calory;
    saveItemsDateTime = dateTime;
    saveItemsOnlyDay = day;
  }

  int ccc = 0;
  int fff = 0;
  int car = 0;
  int ppp = 0;

  void initQolganCaloriyalar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ccc = prefs.getInt("ccc") ?? 0;
    fff = prefs.getInt("fff") ?? 0;
    car = prefs.getInt("car") ?? 0;
    ppp = prefs.getInt("ppp") ?? 0;

    notifyListeners();
  }

//============ Change Language ============
  bool uz = false;
  bool uk = false;
  bool ru = false;
  void changeLangeage(int uzb, int uki, int rus) {
    uz = uzb == 1 ? true : false;
    uk = uki == 1 ? true : false;
    ru = rus == 1 ? true : false;

    notifyListeners();
  }

//============ End Day ============
  bool change_day = false;
  void changeDay() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    change_day = prefs.getBool("change_day") ?? true;
    notifyListeners();
  }

//============ Change Plan ============
  bool init_plan = false;
  void initPlan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    init_plan = prefs.getBool("plan_done") ?? false;
    notifyListeners();
  }

//============== Check internet ==============

//============== Toast ==============

  bool toast = true;
  void isToastenable(bool val) {
    toast = val;
    notifyListeners();
  }
}
