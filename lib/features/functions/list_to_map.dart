Future<void> listToMap(List<int> numbers) async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<int, List<int>> resultMap = {};

  for (int i = 0; i < numbers.length; i++) {
    int number = numbers[i];
    if (resultMap.containsKey(number)) {
      resultMap[number]?.add(i);
    } else {
      resultMap[number] = [i];
    }
  }
}
