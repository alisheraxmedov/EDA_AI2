import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';
import 'package:unavialable/presentation/widget/number_picker.dart';

class PageThreeScreen extends StatelessWidget {
  const PageThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    double _width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width * 0.05,
            vertical: _width * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "weight_and_tall".tr( ),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "weight".tr(),
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                      NumberPickerWidget(
                        start: 15,
                        end: 200,
                        value: context.watch<ProviderClass>().defaultWeight,
                        onChanged: (int value) {
                          context.read<ProviderClass>().onChangeWeight(value);
                        },
                        width: _width,
                      ),
                      Text(
                        "kg".tr(),
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                    ],
                  ),
                  SizedBox(width: _width * 0.04),
                  Column(
                    children: [
                      Text(
                        "tall".tr(),
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                      NumberPickerWidget(
                        start: 30,
                        end: 300,
                        value: context.watch<ProviderClass>().defaultTall,
                        onChanged: (int value) {
                          context.read<ProviderClass>().onChangeTall(value);
                        },
                        width: _width,
                      ),
                      Text(
                        "sm".tr(),
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
