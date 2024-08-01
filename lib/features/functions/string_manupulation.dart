import 'dart:core';

List<double> stringToInt(String dataString) {
  List<String> stringParts = dataString.split('/');
  List<double> doubleList = stringParts
      .map(
        (part) => double.parse(part),
      )
      .toList();
  return doubleList;
}

// Map<String, int> stringToMap(String nutritionStr) {

//   nutritionStr = nutritionStr.split("Please note")[0].trim();

//   RegExp totalCaloriesRegExp = RegExp(r"total_calories:\s*(\d+)");
//   RegExp totalProteinRegExp = RegExp(r"total_protein:\s*(\d+)");
//   RegExp totalFatRegExp = RegExp(r"total_fat:\s*(\d+)");
//   RegExp totalCarbohydrateRegExp = RegExp(r"total_carbohydrate:\s*(\d+)");

//   int totalCalories =
//       int.parse(totalCaloriesRegExp.firstMatch(nutritionStr)!.group(1)!);
//   int totalProtein =
//       int.parse(totalProteinRegExp.firstMatch(nutritionStr)!.group(1)!);
//   int totalFat = int.parse(totalFatRegExp.firstMatch(nutritionStr)!.group(1)!);
//   int totalCarbohydrate =
//       int.parse(totalCarbohydrateRegExp.firstMatch(nutritionStr)!.group(1)!);

//   Map<String, int> nutritionMap = {
//     "total_calories": totalCalories,
//     "total_protein": totalProtein,
//     "total_fat": totalFat,
//     "total_carbohydrate": totalCarbohydrate
//   };

//   return nutritionMap;
// }

Map<String, dynamic> stringToMap(String nutritionStr) {
  Map<String, dynamic> response = {};

  nutritionStr = nutritionStr.split("Please note")[0].trim();

  RegExp totalCaloriesRegExp = RegExp(r"total_calories:\s*(\d+)");
  RegExp totalProteinRegExp = RegExp(r"total_protein:\s*(\d+)");
  RegExp totalFatRegExp = RegExp(r"total_fat:\s*(\d+)");
  RegExp totalCarbohydrateRegExp = RegExp(r"total_carbohydrate:\s*(\d+)");

  RegExpMatch? caloriesMatch = totalCaloriesRegExp.firstMatch(nutritionStr);
  RegExpMatch? proteinMatch = totalProteinRegExp.firstMatch(nutritionStr);
  RegExpMatch? fatMatch = totalFatRegExp.firstMatch(nutritionStr);
  RegExpMatch? carbohydrateMatch =
      totalCarbohydrateRegExp.firstMatch(nutritionStr);

  if (caloriesMatch == null ||
      proteinMatch == null ||
      fatMatch == null ||
      carbohydrateMatch == null) {
    response = {"error": "error"};
  } else {
    int totalCalories = int.parse(caloriesMatch.group(1)!);
    int totalProtein = int.parse(proteinMatch.group(1)!);
    int totalFat = int.parse(fatMatch.group(1)!);
    int totalCarbohydrate = int.parse(carbohydrateMatch.group(1)!);

    response = {
      "total_calories": totalCalories,
      "total_protein": totalProtein,
      "total_fat": totalFat,
      "total_carbohydrate": totalCarbohydrate
    };
  }

  return response;
}
