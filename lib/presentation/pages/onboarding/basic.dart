// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unavialable/features/functions/prefs.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/pages/home.dart';
import 'package:unavialable/presentation/pages/onboarding/page1.dart';
import 'package:unavialable/presentation/pages/onboarding/page2.dart';
import 'package:unavialable/presentation/pages/onboarding/page3.dart';
import 'package:unavialable/presentation/pages/onboarding/page4.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class ShimmerScreen extends StatefulWidget {
  static const String routeName = "/";
  const ShimmerScreen({super.key});

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  void showState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    context.read<ProviderClass>().checkTrue(pref.getBool("state")!);
    // context.read<ProviderClass>().getInformation();
    context.read<ProviderClass>().calculateDailyCalory();
    context.read<ProviderClass>().initQolganCaloriyalar();
  }

  @override
  void initState() {
    showState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GateScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: ColorClass.whiteGrey,
            highlightColor: ColorClass.black,
            child: Text(
              'Cal AI',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: MediaQuery.sizeOf(context).width * 0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class GateScreen extends StatelessWidget {
  static const String routeName = "/gate";
  const GateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderClass>();

    return provider.isTrue ? const HomePage() : const BasicScreen();
  }
}

class BasicScreen extends StatelessWidget {
  static const String routeName = "/basic";
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              context.read<ProviderClass>().isLastPage(value);
              print("Page index: $value");
            },
            children: const [
              PageOneScreen(),
              PageTwoScreen(),
              PageThreeScreen(),
              PageFourScreen(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorClass.whiteGrey,
                    borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width * 0.04,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "back".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                ),
                Consumer<ProviderClass>(
                  builder: (context, provider, child) {
                    return provider.lastIndex
                        ? Container(
                            decoration: BoxDecoration(
                              color: ColorClass.whiteGrey,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).width * 0.04,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                
                                await SharedPreferencesClass.setData(
                                  provider.isClicked1 ? "Erkak" : "Ayol",
                                  provider.times1
                                      ? "0-2"
                                      : provider.times2
                                          ? "3-5"
                                          : "6+",
                                  provider.goal1
                                      ? "Vazn olish"
                                      : provider.goal2
                                          ? "O'z holida saqlash"
                                          : "Vazn tashlash",
                                  provider.defaultWeight,
                                  provider.defaultTall,
                                  provider.date,
                                );
                                SharedPreferencesClass.setPageState(
                                  true,
                                );
                                Navigator.pushNamed(
                                  context,
                                  ShimmerScreen.routeName,
                                );
                              },
                              child: Text(
                                "done".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: ColorClass.whiteGrey,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).width * 0.04,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                "previos".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
