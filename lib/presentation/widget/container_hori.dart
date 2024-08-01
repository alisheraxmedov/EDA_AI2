// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class HorizontalContainerWidget extends StatelessWidget {
  const HorizontalContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

    double _width = MediaQuery.sizeOf(context).width;
    return Consumer<ProviderClass>(
      builder: (context, value, child) {
        int calory = value.ccc == 0
            ? value.dailyCalory
            : value.ccc < 0
                ? 0
                : value.ccc;
        print(
            "${value.ccc} *** ${value.dailyCalory} *** ${value.ppp} *** ${value.calory}");
        return Card(
          child: Container(
            height: _width * 0.35,
            decoration: BoxDecoration(
              color: ColorClass.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  _width * 0.05,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${value.ccc == 0 ? value.dailyCalory : value.ccc < 0 ? 0 : value.ccc}",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: _width * 0.1,
                                  ),
                        ),
                        Text(
                          "remaining_calory".tr(),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
                /*
            daily -------- 100
            calor -------- X          
             */
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(_width * 0.02),
                    child: DashedCircularProgressBar.aspectRatio(
                      aspectRatio: 1, // width ÷ height
                      valueNotifier: _valueNotifier,
                      progress: 100 - (calory / value.dailyCalory) * 100.0,
                      startAngle: 0,
                      sweepAngle: 359,
                      foregroundColor: ColorClass.black,
                      backgroundColor: const Color.fromARGB(255, 245, 243, 243),
                      foregroundStrokeWidth: 12,
                      backgroundStrokeWidth: 12,
                      animation: true,
                      seekSize: 6,
                      seekColor: ColorClass.white,
                      child: Center(
                        child: ValueListenableBuilder(
                            valueListenable: _valueNotifier,
                            builder: (_, double value, __) {
                              return CircleAvatar(
                                radius: _width * 0.075,
                                backgroundColor:
                                    const Color.fromARGB(255, 245, 243, 243),
                                child: Container(
                                  height: _width * 0.1,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/icons/calory.png",
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
