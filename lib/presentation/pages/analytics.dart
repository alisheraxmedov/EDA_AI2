import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unavialable/features/functions/sort_list.dart';
import 'package:unavialable/presentation/const/color.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late List<int> sortedList = [];
  late List<String> daysList = [];
  late List<String> month_list = [
    "Yanvar".tr(),
    "Fevral".tr(),
    "Mart".tr(),
    "Aprel".tr(),
    "May".tr(),
    "Iyun".tr(),
    "Iyul".tr(),
    "Avgust".tr(),
    "Sentabr".tr(),
    "Oktabr".tr(),
    "Noyabr".tr(),
    "Dekabr".tr()
  ];

  @override
  void initState() {
    _initFunction();
    super.initState();
  }

  Future<void> _initFunction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      daysList = prefs.getStringList("ls_days") ?? [];
      sortedList = removeConsecutiveDuplicates(daysList);
    });

    print(daysList);
    print(sortedList);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorClass.whiteGrey,
      body: sortedList.isNotEmpty
          ? Column(
              children: [
                SizedBox(
                  height: width * 0.04,
                ),
                Text(
                  "statistic".tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: width * 0.065,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: sortedList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05,
                          vertical: width * 0.04,
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.fastfood,
                            color: ColorClass.black,
                            size: width * 0.09,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward,
                            color: ColorClass.black,
                            size: width * 0.08,
                          ),
                          tileColor: ColorClass.white,
                          title: Text(
                            "${"date".tr()}-${sortedList[index]}",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: width * 0.065,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                "not_available".tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
    );
  }
}
