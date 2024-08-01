import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/pages/analytics.dart';
import 'package:unavialable/presentation/pages/setting.dart';
import 'package:unavialable/presentation/provider/provider.dart';
import 'package:unavialable/presentation/widget/alert_dialog.dart';
import 'package:unavialable/presentation/widget/bottom_sheet.dart';
import 'package:unavialable/presentation/widget/container_hori.dart';
import 'package:unavialable/presentation/widget/mini_container.dart';
import 'package:unavialable/presentation/widget/saved_list.dart';
import 'package:unavialable/presentation/widget/title.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderClass>(context, listen: false).initPlan();
    showState();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      _isChangeDate();
    });
  }

  void showState() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // context.read<ProviderClass>().checkTrue(pref.getBool("state")!);
    // context.read<ProviderClass>().getInformation();
    // context.read<ProviderClass>().calculateDailyCalory();
    context.read<ProviderClass>().initQolganCaloriyalar();
  }

  Future<void> _isChangeDate() async {
    String day = DateFormat('dd').format(DateTime.now());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _day_list = prefs.getStringList("ls_days") ?? [];
    ProviderClass provider = Provider.of<ProviderClass>(context, listen: false);
    provider.isDayChange();
    if (day != _day_list[_day_list.length - 1]) {
      prefs.setBool("plan_done", false);
      provider.initPlan();

      prefs.setInt("ccc", prefs.getInt("allCalory") ?? 0);
      prefs.setInt("fff", prefs.getInt("allFat") ?? 0);
      prefs.setInt("car", prefs.getInt("allCarb") ?? 0);
      prefs.setInt("ppp", prefs.getInt("allProtein") ?? 0);

      provider.initQolganCaloriyalar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/myhomepage";
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    List<Widget> _pages = const [
      HomeBodyPage(),
      AnalyticsPage(),
      SettingsPage(),
    ];
   

    return Scaffold(
      backgroundColor: ColorClass.whiteGrey,
      appBar: AppBar(
//====================================  Logo and Name ====================================
        title: TitleWidget(width: width),
//====================================  LogOut Button ====================================
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.notifications,
              color: ColorClass.black,
              size: width * 0.09,
            ),
          ),
          SizedBox(width: width * 0.03),
        ],
      ),
//====================================  Home body ====================================
      body: _pages[context.watch<ProviderClass>().activeIndex],
//==================================== NavBar and Button ====================================
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorClass.black,
        child: Icon(Icons.add, color: ColorClass.white, size: width * 0.1),
        onPressed: () {
          // Provider.of<ProviderClass>(context, listen: false)
          //     .checkConnectivity();

          // if ( ) {

          // } else {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const InternetErorAlertDialog();
          //     },
          //   );
          // }
          Provider.of<ProviderClass>(context, listen: false).init_plan
              ? showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialogWidget();
                  },
                )
              : showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return MyBottomSheetWidget(width: width);
                  },
                );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: width * 0.17,
        icons: const [Icons.home, Icons.analytics_outlined, Icons.settings],
        activeIndex: context.watch<ProviderClass>().activeIndex,
        activeColor: ColorClass.black,
        inactiveColor: ColorClass.grey,
        iconSize: width * 0.1,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          context.read<ProviderClass>().changeIndex(index);
        },
      ),
    );
  }
}

class HomeBodyPage extends StatelessWidget {
  const HomeBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: width * 0.07,
        ),
        child: Consumer<ProviderClass>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HorizontalContainerWidget(),
                SizedBox(
                  height: width * 0.04,
                ),
                //==================================== Protein, Fats, Carbs ====================================
                ThreeSubtanceWidget(
                  kunlikOqsil: provider.oqsilCalory.toInt(),
                  kunlikUglevod: provider.uglevodCalory.toInt(),
                  kunlikYog: provider.yogCalory.toInt(),
                  //
                  oqsil: provider.ppp == 0
                      ? provider.oqsilCalory.toInt()
                      : provider.ppp < 0
                          ? 0
                          : provider.ppp,
                  //
                  uglevod: provider.car == 0
                      ? provider.uglevodCalory.toInt()
                      : provider.car < 0
                          ? 0
                          : provider.car,
                  //
                  yog: provider.fff == 0
                      ? provider.yogCalory.toInt()
                      : provider.fff < 0
                          ? 0
                          : provider.fff,
                ),
                SizedBox(
                  height: width * 0.055,
                ),
                //==================================== Text for Resently Food ====================================
                Text(
                  "near_eat".tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: width * 0.055,
                      ),
                ),
                SizedBox(
                  height: width * 0.04,
                ),
                //==================================== Saved Food Item ====================================
                const SavedFoodItemsWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
