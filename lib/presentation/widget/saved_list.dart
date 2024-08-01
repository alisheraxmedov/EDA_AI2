// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unavialable/features/functions/string_manupulation.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class SavedFoodItemsWidget extends StatefulWidget {
  const SavedFoodItemsWidget({super.key});

  @override
  State<SavedFoodItemsWidget> createState() => _SavedFoodItemsWidgetState();
}

class _SavedFoodItemsWidgetState extends State<SavedFoodItemsWidget> {
  late List<String> _paths = [];
  late List<String> _calories = [];
  late List<String> _dateTimes = [];

  late List<String> _days = [];
  @override
  void initState() {
    _initPrefs();
    super.initState();
  }

  Future<void> _initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _paths = prefs.getStringList("ls_images") ?? [];
      _calories = prefs.getStringList("ls_calories") ?? [];
      _dateTimes = prefs.getStringList("ls_dates") ?? [];

      _days = prefs.getStringList("ls_days") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.sizeOf(context).width;
    return _days.isNotEmpty
        ? context.watch<ProviderClass>().day == _days[_days.length - 1]
            ? SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: _paths.length,
                  // itemCount: _todayListIndex.length,
                  itemBuilder: (context, index) {
                    if (context.watch<ProviderClass>().day == _days[index]) {
                      return Column(
                        children: [
                          ItemsWidget(
                            image: _paths[(_paths.length - 1) - index],
                            time: _dateTimes[(_paths.length - 1) - index],
                            width: _width,
                            tarkib: stringToInt(
                              _calories[(_paths.length - 1) - index],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox(height: 0.0);
                    }

                    // return _day == _days[index]
                    //     ? Column(
                    //         children: [
                    //           ItemsWidget(
                    //             image: _paths[(_paths.length - 1) - index],
                    //             time: _dateTimes[(_paths.length - 1) - index],
                    //             width: _width,
                    //             tarkib: stringToInt(
                    //               _calories[(_paths.length - 1) - index],
                    //             ),
                    //           ),
                    //           SizedBox(height: _width * 0.04),
                    //         ],
                    //       )
                  },
                ),
              )
            : GestureDetector(
                onTap: () {
                  List<double> a = stringToInt(
                    _calories[0],
                  );
                  print(a);
                  print(_paths.length);
                },
                child: Container(
                  height: _width * 0.4,
                  alignment: Alignment.center,
                  color: ColorClass.white,
                  child: Text(
                    "nodata_at_the_moment".tr(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontSize: _width * 0.05,
                        ),
                  ),
                ),
              )
        : Container(
            height: _width * 0.4,
            alignment: Alignment.center,
            color: ColorClass.white,
            child: Text(
              "nodata_at_the_moment".tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontSize: _width * 0.05,
                  ),
            ),
          );
  }
}

class ItemsWidget extends StatelessWidget {
  final String image;
  final String time;
  final double width;
  // final int calory;
  final List<double> tarkib;

  const ItemsWidget({
    super.key,
    required this.image,
    required this.time,
    required this.width,
    // required this.calory,
    required this.tarkib,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.015),
      child: Container(
        height: width * 0.35,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(
              width * 0.05,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      width * 0.05,
                    ),
                    bottomLeft: Radius.circular(
                      width * 0.05,
                    ),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(
                      File(image),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 243, 243),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      width * 0.05,
                    ),
                    bottomRight: Radius.circular(
                      width * 0.05,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: width * 0.03,
                    horizontal: width * 0.04,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorClass.white,
                              borderRadius: BorderRadius.circular(width * 0.01),
                            ),
                            child: Text(
                              time,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(),
                            ),
                          )
                        ],
                      ),
                      // SizedBox(height: width*0.024),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: width * 0.06,
                            width: width * 0.06,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/icons/calory.png",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Text(
                            "${tarkib[0]} ${"_calory".tr()}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.045),
                          ),
                        ],
                      ),
                      // SizedBox(height: width*0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ============ 1 ============
                          SizedBox(
                            width: width * 0.14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/meat.svg',
                                  width: width * 0.04,
                                  height: width * 0.04,
                                  // ignore: deprecated_member_use
                                  colorFilter: const ColorFilter.mode(
                                    ColorClass.red,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Text(
                                  "${tarkib[1]}${"_g".tr()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.03),
                                ),
                              ],
                            ),
                          ),
                          // ============ 2 ============
                          SizedBox(
                            width: width * 0.14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/wheat.svg',
                                  width: width * 0.04,
                                  height: width * 0.04,
                                  // ignore: deprecated_member_use
                                  colorFilter: const ColorFilter.mode(
                                    ColorClass.orange,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Text(
                                  "${tarkib[2]}${"_g".tr()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.03,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          // ============ 3 ============
                          SizedBox(
                            width: width * 0.14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/pear3.svg',
                                  width: width * 0.04,
                                  height: width * 0.04,
                                  // ignore: deprecated_member_use
                                  colorFilter: const ColorFilter.mode(
                                    ColorClass.blue,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Text(
                                  "${tarkib[3]}${"_g".tr()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.03,
                                      ),
                                ),
                              ],
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
      ),
    );
  }
}
