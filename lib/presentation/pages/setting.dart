import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/features/functions/prefs.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/pages/onboarding/basic.dart';
import 'package:unavialable/presentation/provider/provider.dart';
import 'package:unavialable/presentation/widget/language_shet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: ColorClass.whiteGrey,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: width * 0.07,
        ),
        child: Column(
          children: [
// ========================== Log Out tile ==========================
            HandleTileWidget(
              width: width,
              icon: Icons.language,
              tileText: "change_lang".tr(),
              iconColor: ColorClass.black,
              onTap: () async {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return ChangeLanguageWidget(width: width);
                  },
                );
              },
            ),
            SizedBox(height: width * 0.07),

// ========================== Log Out tile ==========================
            HandleTileWidget(
              width: width,
              icon: Icons.logout_outlined,
              tileText: "log_out".tr(),
              iconColor: ColorClass.black,
              onTap: () async {
                final ProviderClass p =
                    Provider.of<ProviderClass>(context, listen: false);

                SharedPreferencesClass.deleteAllData();
                SharedPreferencesClass.deleteData();
                SharedPreferencesClass.setPageState(false);

                p.checkTrue(false);
                p.isLastPage(0);
                p.initLists();
                p.changeIndex(0);
                
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  GateScreen.routeName,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HandleTileWidget extends StatelessWidget {
  final double width;
  final IconData icon;
  final String tileText;
  final Color iconColor;
  final void Function()? onTap;
  const HandleTileWidget({
    super.key,
    required this.width,
    required this.icon,
    required this.tileText,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: width * 0.15,
              width: width,
              decoration: BoxDecoration(
                color: ColorClass.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    width * 0.055,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      size: width * 0.08,
                      color: iconColor,
                    ),
                    SizedBox(width: width * 0.03),
                    Text(
                      tileText,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: width * 0.05),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
