import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class PageFourScreen extends StatelessWidget {
  const PageFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _width * 0.05,
            vertical: _width * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "dob".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: _width * 0.08),
              ),
              SizedBox(height: _width * 0.02),
              Text(
                "reason".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: _width * 0.04),
              ),
              SizedBox(height: _width * 0.02),
              GestureDetector(
                onTap: () {
                  BottomPicker.date(
                    buttonContent: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "save".tr(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: _width*0.04),
                      ),
                    ),
                    pickerTitle: Text(
                      "select_dob".tr(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                    ),
                    dateOrder: DatePickerDateOrder.ydm,
                    pickerTextStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(),
                    onChange: (value) {
                      context.read<ProviderClass>().changeDate(value);
                    },
                    onSubmit: (value) {
                      context.read<ProviderClass>().changeDate(value);
                    },
                    bottomPickerTheme: BottomPickerTheme.temptingAzure,
                  ).show(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: _width * 0.17),
                  alignment: Alignment.center,
                  height: _width * 0.15,
                  width: _width * 0.9,
                  decoration: BoxDecoration(
                    color: ColorClass.whiteGrey,
                    borderRadius: BorderRadius.circular(_width * 0.03),
                  ),
                  child: Text(
                    context.watch<ProviderClass>().date,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorClass.black,
                          fontSize: _width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
