import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    double _width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _width * 0.05, vertical: _width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "train_time".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: _width * 0.08),
              ),
              SizedBox(height: _width * 0.02),
              Text(
                "reason".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: _width * 0.04),
              ),
              SizedBox(height: _width * 0.04),
              Row(
                children: [
                  Expanded(
                    child: GestureDetectorWidget(
                      data: "0-2",
                      width: _width,
                      onTap: () {
                        context.read<ProviderClass>().selectedTimes(1);
                      },
                      color: context.watch<ProviderClass>().times1
                          ? ColorClass.black
                          : ColorClass.whiteGrey,
                      textColor: context.watch<ProviderClass>().times1
                          ? ColorClass.white
                          : ColorClass.black,
                    ),
                  ),
                  SizedBox(width: _width * 0.02),
                  Expanded(
                    child: GestureDetectorWidget(
                      data: "3-5",
                      width: _width,
                      onTap: () {
                        context.read<ProviderClass>().selectedTimes(2);
                      },
                      color: context.watch<ProviderClass>().times2
                          ? ColorClass.black
                          : ColorClass.whiteGrey,
                      textColor: context.watch<ProviderClass>().times2
                          ? ColorClass.white
                          : ColorClass.black,
                    ),
                  ),
                  SizedBox(width: _width * 0.02),
                  Expanded(
                    child: GestureDetectorWidget(
                      data: "6+",
                      width: _width,
                      onTap: () {
                        context.read<ProviderClass>().selectedTimes(3);
                      },
                      color: context.watch<ProviderClass>().times3
                          ? ColorClass.black
                          : ColorClass.whiteGrey,
                      textColor: context.watch<ProviderClass>().times3
                          ? ColorClass.white
                          : ColorClass.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: _width * 0.12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "goal".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: _width * 0.08),
                  ),
                ],
              ),
              SizedBox(height: _width * 0.04),
              SizedBox(
                height: _width * 0.4,
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetectorWidget(
                        data: "weight_gain".tr(),
                        width: _width,
                        onTap: () {
                          context.read<ProviderClass>().selectedGoal(1);
                        },
                        color: context.watch<ProviderClass>().goal1
                            ? ColorClass.black
                            : ColorClass.whiteGrey,
                        textColor: context.watch<ProviderClass>().goal1
                            ? ColorClass.white
                            : ColorClass.black,
                      ),
                    ),
                    SizedBox(height: _width * 0.02),
                    Expanded(
                      child: GestureDetectorWidget(
                        data: "weight_save".tr(),
                        width: _width,
                        onTap: () {
                          context.read<ProviderClass>().selectedGoal(2);
                        },
                        color: context.watch<ProviderClass>().goal2
                            ? ColorClass.black
                            : ColorClass.whiteGrey,
                        textColor: context.watch<ProviderClass>().goal2
                            ? ColorClass.white
                            : ColorClass.black,
                      ),
                    ),
                    SizedBox(height: _width * 0.02),
                    Expanded(
                      child: GestureDetectorWidget(
                        data: "weight_lose".tr(),
                        width: _width,
                        onTap: () {
                          context.read<ProviderClass>().selectedGoal(3);
                        },
                        color: context.watch<ProviderClass>().goal3
                            ? ColorClass.black
                            : ColorClass.whiteGrey,
                        textColor: context.watch<ProviderClass>().goal3
                            ? ColorClass.white
                            : ColorClass.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  final double width;
  final String data;
  final Color color;
  final Color textColor;
  final void Function()? onTap;
  const GestureDetectorWidget({
    super.key,
    required this.data,
    required this.width,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: width * 0.1,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(width * 0.05),
        ),
        child: Text(
          data,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: width * 0.045, color: textColor),
        ),
      ),
    );
  }
}
