import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _width * 0.05, vertical: _width * 0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "select".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: _width * 0.08),
                  ),
                ],
              ),
              SizedBox(height: _width * 0.02),
              Text(
                "reason".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: _width * 0.04),
              ),
              SizedBox(height: _width * 0.2),
              Row(
                children: [
                  //================================== <Male> =====================================
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<ProviderClass>().changeClick(1);
                        // SharedPreferencesClass.setAndUpdateGender(
                        //   "gender",
                        //   "Erkak",
                        // );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.watch<ProviderClass>().isClicked1
                              ? ColorClass.black
                              : ColorClass.whiteGrey,
                          borderRadius: BorderRadius.circular(_width * 0.05),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/male.svg",
                              width: _width * 0.3,
                              height: _width * 0.3,
                              colorFilter: ColorFilter.mode(
                                context.watch<ProviderClass>().isClicked1
                                    ? ColorClass.white
                                    : ColorClass.black,
                                BlendMode.srcIn,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'male'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: _width * 0.04,
                                        color: context
                                                .watch<ProviderClass>()
                                                .isClicked1
                                            ? ColorClass.white
                                            : ColorClass.black,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: _width * 0.01),
                  //================================== <Female> =====================================
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<ProviderClass>().changeClick(2);
                        // SharedPreferencesClass.setAndUpdateGender(
                        //   "gender",
                        //   "Ayol",
                        // );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.watch<ProviderClass>().isClicked2
                              ? ColorClass.black
                              : ColorClass.whiteGrey,
                          borderRadius: BorderRadius.circular(_width * 0.05),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/female.svg",
                              width: _width * 0.3,
                              height: _width * 0.3,
                              colorFilter: ColorFilter.mode(
                                context.watch<ProviderClass>().isClicked2
                                    ? ColorClass.white
                                    : ColorClass.black,
                                BlendMode.srcIn,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'female'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: _width * 0.04,
                                        color: context
                                                .watch<ProviderClass>()
                                                .isClicked2
                                            ? ColorClass.white
                                            : ColorClass.black,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
