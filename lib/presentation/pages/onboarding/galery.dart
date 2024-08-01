import 'package:flutter/material.dart';
import 'package:unavialable/features/functions/meal_api.dart';
import 'package:unavialable/presentation/const/color.dart';

class FromGaleryScreen extends StatefulWidget {
  static const String routeName = "/galery";
  const FromGaleryScreen({super.key});

  @override
  State<FromGaleryScreen> createState() => _FromGaleryScreenState();
}

class _FromGaleryScreenState extends State<FromGaleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: Center(
        child: FutureBuilder(
          // future: callWithGaleryApi(context),
          future: callApiFromGallery(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).width * 0.1,
                width: MediaQuery.sizeOf(context).width * 0.1,
                child: const CircularProgressIndicator(
                  color: ColorClass.black,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text('Server yoki Internet bilan muammo\nbor'));
            } else {
              Navigator.pop(context);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Icon(
                    Icons.download_done,
                    color: ColorClass.green.withOpacity(0.5),
                    size: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  // child: Text(
                  //   'Natija: ${context.watch<ProviderClass>().totalCalories}',
                  //   style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  //         color: ColorClass.black,
                  //       ),
                  // ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
