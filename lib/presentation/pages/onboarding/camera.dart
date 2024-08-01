import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/features/functions/meal_api.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class SinovScreen extends StatefulWidget {
  static const String routeName = "/camera";
  const SinovScreen({super.key});

  @override
  State<SinovScreen> createState() => _SinovScreenState();
}

class _SinovScreenState extends State<SinovScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: Center(
        child: FutureBuilder(
          // future: callWithGaleryApi(context),
          future: callApiFromCamera(context),
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
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    'Natija: ${context.watch<ProviderClass>().calory}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorClass.black,
                        ),
                  ),
                ),
              );
            }
            // if (snapshot.hasData) {
            //   return const Column(
            //     children: [
            //       Text("snapshot.data"),
            //     ],
            //   );
            // }
            // return const Center(
            //   child: Text("Ma'lumot yuklanishini kuting"),
            // );
          },
        ),
      ),
    );
  }
}
