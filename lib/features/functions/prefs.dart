import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
// ========================= to write data =========================
  static Future<void> setData(
    String gender,
    String plan,
    String goal,
    int weight,
    int tall,
    String dob,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gender", gender);
    prefs.setString("plan", plan);
    prefs.setString("goal", goal);
    prefs.setInt("weight", weight);
    prefs.setInt("tall", tall);
    prefs.setString("dob", dob);
  }

// ========================= to read gender =========================
  static Future<void> getGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("gender");
  }

// ========================= to read train plan =========================
  static Future<void> getPlan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("plan");
  }

// ========================= to read goal =========================
  static Future<void> getGoal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("goal");
  }

// ========================= to read weight =========================
  static Future<void> getWeight() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt("weight");
  }

// ========================= to read Tall =========================
  static Future<void> getTall() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt("tall");
  }

// ========================= to read date of birth =========================
  static Future<void> getDob() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("dob");
  }

  static Future<void> deleteData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("gender");
    prefs.remove("plan");
    prefs.remove("goal");
    prefs.remove("weight");
    prefs.remove("tall");
    prefs.remove("dob");
  }

//********************************************************************
  static Future<void> setPageState(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("state", value);
  }

  static Future<void> getPageState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool("state");
  }

  // ================ Calculate all calories and save =================
  static void saveAllCalory(int all, int fat, int carb, int protein) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("allCalory", all);
    prefs.setInt("allFat", fat);
    prefs.setInt("allCarb", carb);
    prefs.setInt("allProtein", protein);
  }

  static void deleteAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove("state");
    prefs.remove("lsImages");
    prefs.remove("lsTimes");
    prefs.remove("ls_images");
    prefs.remove("ls_calories");
    prefs.remove("ls_dates");
    prefs.remove("ls_days");
    prefs.remove("ls_month");
    prefs.remove("allCalory");
    prefs.remove("allFat");
    prefs.remove("allCarb");
    prefs.remove("allProtein");
    prefs.remove("ccc");
    prefs.remove("fff");
    prefs.remove("car");
    prefs.remove("ppp");

    prefs.remove("plan_done");
  }

  // static Future<bool> isPlanDone() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool("plan_done") ?? true;
  // }
}
