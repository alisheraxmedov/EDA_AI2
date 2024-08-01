import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class ChangeLanguageWidget extends StatelessWidget {
  final double width;
  const ChangeLanguageWidget({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.66,
      width: width,
      decoration: const BoxDecoration(
        color: ColorClass.whiteGrey,
      ),
      child: Column(
        children: [
          SizedBox(height: width * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Text(
              "select_language".tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: width * 0.065,
                    letterSpacing: 1.0,
                  ),
            ),
          ),
          SizedBox(height: width * 0.02),
          LanguageTileWidget(
            width: width,
            til: "lang_uz".tr(),
            iconColor: ColorClass.black,
            image: "assets/flags/uzb.png",
            onTap: () {
              context.read<ProviderClass>().changeLangeage(1, 0, 0);
              context.setLocale(
                const Locale("uz", "UZ"),
              );
              Navigator.pop(context);
            },
            conddition: context.watch<ProviderClass>().uz,
          ),
          LanguageTileWidget(
            width: width,
            til: "lang_en".tr(),
            iconColor: ColorClass.black,
            image: "assets/flags/uk.png",
            onTap: () {
              context.read<ProviderClass>().changeLangeage(0, 1, 0);
              context.setLocale(
                const Locale("en", "US"),
              );
              Navigator.pop(context);
            },
            conddition: context.watch<ProviderClass>().uk,
          ),
          LanguageTileWidget(
            width: width,
            til: "lang_ru".tr(),
            iconColor: ColorClass.black,
            image: "assets/flags/rus.png",
            onTap: () {
              context.read<ProviderClass>().changeLangeage(0, 0, 1);
              context.setLocale(
                const Locale("ru", "RU"),
              );
              Navigator.pop(context);
            },
            conddition: context.watch<ProviderClass>().ru,
          ),
        ],
      ),
    );
  }
}

class LanguageTileWidget extends StatelessWidget {
  final double width;
  final String til;
  final Color iconColor;
  final String image;
  final bool conddition;
  final void Function()? onTap;
  const LanguageTileWidget({
    super.key,
    required this.width,
    required this.til,
    required this.iconColor,
    required this.image,
    required this.onTap,
    required this.conddition,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: width * 0.01),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: width * 0.12,
          width: width,
          decoration: BoxDecoration(
            color: ColorClass.white,
            borderRadius: BorderRadius.circular(
              width * 0.05,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: width * 0.12,
                  width: width * 0.12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                    ),
                  ),
                ),
                Text(
                  til,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: width * 0.04),
                ),
                Icon(
                  Icons.done,
                  color: conddition ? ColorClass.black : ColorClass.white,
                  size: width * 0.07,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
