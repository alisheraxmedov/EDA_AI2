import 'package:flutter/material.dart';
import 'package:unavialable/features/functions/meal_api.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/pages/home.dart';

class AlertDialogCallGPT extends StatelessWidget {
  final double width;
  const AlertDialogCallGPT({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorClass.white.withOpacity(0.0),
      content: FutureBuilder(
        future: callApiFromGallery(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorClass.white,
                strokeWidth: 7,
              ),
            );
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          });
          return Container();
        },
      ),
    );
  }
}

class AlertDialogCallGPTCamera extends StatelessWidget {
  final double width;
  const AlertDialogCallGPTCamera({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorClass.white.withOpacity(0.0),
      content: FutureBuilder(
        future: callApiFromCamera(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorClass.white,
                strokeWidth: 7,
              ),
            );
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          });
          return Container();
        },
      ),
    );
  }
}
