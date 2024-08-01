List<int> removeConsecutiveDuplicates(List<String> inputList) {
  if (inputList.isEmpty) {
    return [];
  }

  List<int> result = [];
  result.add(int.parse(inputList[0]));

  for (int i = 1; i < inputList.length; i++) {
    if (inputList[i] != inputList[i - 1]) {
      result.add(int.parse(inputList[i]));
    }
  }

  return result;
}
