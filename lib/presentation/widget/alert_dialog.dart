import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unavialable/presentation/const/color.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorClass.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "close".tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorClass.red,
                ),
          ),
        ),
      ],
      title: Text(
        "done".tr(),
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: ColorClass.green.withOpacity(0.3)),
      ),
      content: Text(
        "todays_mesage".tr(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(),
      ),
    );
  }
}

class InternetErorAlertDialog extends StatelessWidget {
  const InternetErorAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorClass.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "close".tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorClass.red,
                ),
          ),
        ),
      ],
      title: Text(
        "no_internet".tr(),
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: ColorClass.red.withOpacity(0.3)),
      ),
      content: Text(
        "no_internet_message".tr(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(),
      ),
    );
  }
}

class AlertDialogWidgetResponseError extends StatelessWidget {
  const AlertDialogWidgetResponseError({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorClass.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "close".tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorClass.red,
                ),
          ),
        ),
      ],
      title: Text(
        "not_found_food".tr(),
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: ColorClass.red.withOpacity(0.3)),
      ),
      content: Text(
        "error_send_image".tr(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(),
      ),
    );
  }
}

void showToast(double fontSize) {
  Fluttertoast.showToast(
    msg: "not_found_food".tr(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorClass.whiteGrey,
    textColor: ColorClass.red,
    fontSize: 16.0,
  );
}
