import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:unavialable/presentation/const/color.dart';

class NumberPickerWidget extends StatelessWidget {
  final int start;
  final int end;
  final int value;
  final void Function(int) onChanged;
  final double width;

  const NumberPickerWidget({
    super.key,
    required this.start,
    required this.end,
    required this.value,
    required this.onChanged,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorClass.whiteGrey,
        borderRadius: BorderRadius.circular(
          width * 0.1,
        ),
      ),
      height: width * 0.7,
      width: width * 0.15,
      child: NumberPicker(
        minValue: start,
        maxValue: end,
        itemCount: 6,
        selectedTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(),
        textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
