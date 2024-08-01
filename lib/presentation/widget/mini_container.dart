// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unavialable/presentation/const/color.dart';

class ThreeSubtanceWidget extends StatelessWidget {
  final int oqsil;
  final int kunlikOqsil;
  final int uglevod;
  final int kunlikUglevod;
  final int yog;
  final int kunlikYog;
  const ThreeSubtanceWidget({
    super.key,
    required this.oqsil,
    required this.kunlikOqsil,
    required this.uglevod,
    required this.kunlikUglevod,
    required this.yog,
    required this.kunlikYog,
  });

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularProgressIndicator(
          width: _width,
          progress: 100 - (oqsil / kunlikOqsil * 100),
          indicatorColor: ColorClass.red,
          subtance: oqsil,
          name: "protein".tr(),
          svgPath: "assets/svg/wheat.svg",
        ),
        CircularProgressIndicator(
          width: _width,
          progress: 100 - (uglevod / kunlikUglevod * 100),
          indicatorColor: ColorClass.orange,
          subtance: uglevod,
          name: "carb".tr(),
          svgPath: "assets/svg/pear3.svg",
        ),
        CircularProgressIndicator(
          width: _width,
          progress: 100 - (yog / kunlikYog * 100),
          indicatorColor: ColorClass.blue,
          subtance: yog,
          name: "fat".tr(),
          svgPath: "assets/svg/meat.svg",
        ),
      ],
    );
  }
}

class CircularProgressIndicator extends StatelessWidget {
  final double width;
  final double progress;
  final Color indicatorColor;
  final int subtance;
  final String name;
  final String svgPath;

  const CircularProgressIndicator({
    super.key,
    required this.width,
    required this.progress,
    required this.indicatorColor,
    required this.subtance,
    required this.name,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
    return Card(
      child: Container(
        height: width * 0.4,
        width: width * 0.27,
        decoration: BoxDecoration(
          color: ColorClass.white,
          borderRadius: BorderRadius.circular(width * 0.05),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${subtance}g",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: width * 0.05,
                        ),
                  ),
                  Text(
                    "${"remain".tr()} $name",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.2,
                child: DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 1,
                  valueNotifier: _valueNotifier,
                  progress: progress,
                  startAngle: 0,
                  sweepAngle: 359,
                  foregroundColor: indicatorColor,
                  backgroundColor: const Color.fromARGB(255, 245, 243, 243),
                  foregroundStrokeWidth: 9,
                  backgroundStrokeWidth: 9,
                  animation: true,
                  seekSize: 6,
                  seekColor: ColorClass.white,
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: _valueNotifier,
                      builder: (_, double value, __) => CircleAvatar(
                        radius: width * 0.055,
                        backgroundColor:
                            const Color.fromARGB(255, 245, 243, 243),
                        child: SvgPicture.asset(
                          svgPath,
                          width: width * 0.05,
                          height: width * 0.05,
                          // ignore: deprecated_member_use
                          colorFilter: ColorFilter.mode(
                            indicatorColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
