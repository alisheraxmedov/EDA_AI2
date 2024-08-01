import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/pages/load.dart';

class MyBottomSheetWidget extends StatelessWidget {
  final double width;
  const MyBottomSheetWidget({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * 0.06, vertical: width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyContainerWidget(
                width: width,
                text: "train_journal".tr(),
                containerColor: ColorClass.grey,
                imagePath: "assets/svg/exercise.svg",
                onTap: () {},
              ),
              MyContainerWidget(
                width: width,
                text: "saved_food".tr(),
                containerColor: ColorClass.grey,
                imagePath: "assets/svg/saved.svg",
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyContainerWidget(
                width: width,
                text: "describe_food".tr(),
                containerColor: ColorClass.white,
                imagePath: "assets/svg/notes.svg",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogCallGPT(width: width);
                    },
                  ).then(
                    (value) {
                      Navigator.pop(context);
                    },
                  );
                  //

                  // callApiFromGallery(context).then(
                  //   (value) {
                  //     // Navigator.pop(context);
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, HomePage.routeName, (route) => false);
                  //   },
                  // );
                },
              ),
              MyContainerWidget(
                width: width,
                text: "scan_food".tr(),
                containerColor: ColorClass.white,
                imagePath: "assets/svg/scan.svg",
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogCallGPTCamera(width: width);
                    },
                  ).then(
                    (value) {
                      Navigator.pop(context);
                    },
                  );
                  // callApiFromCamera(context).then(
                  //   (value) async {
                  //     // Navigator.pop(context);
                  //     Navigator.pushNamedAndRemoveUntil(
                  //         context, HomePage.routeName, (route) => false);
                  //   },
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  final double width;
  final String text;
  final Color containerColor;
  final String imagePath;
  final void Function()? onTap;
  const MyContainerWidget({
    super.key,
    required this.width,
    required this.text,
    required this.containerColor,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: width * 0.28,
        width: width * 0.42,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              width * 0.065,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: width * 0.075,
              backgroundColor: const Color.fromARGB(255, 245, 243, 243),
              child: SvgPicture.asset(
                imagePath,
                width: width * 0.1,
                height: width * 0.1,
                // ignore: deprecated_member_use
                colorFilter: const ColorFilter.mode(
                  ColorClass.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: width * 0.42,
              child: Text(
                overflow: TextOverflow.ellipsis,
                text,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: width * 0.04,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
