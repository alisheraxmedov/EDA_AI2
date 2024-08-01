import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/presentation/const/color.dart';
import 'package:unavialable/presentation/provider/provider.dart';

class TextButtonsWidget extends StatelessWidget {
  const TextButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      // height: context.watch<ProviderClass>().width * .11,
      // width: context.watch<ProviderClass>().width * .5,
      // color: Colors.amber,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ================== Bugun ==================
          GestureDetector(
            onTap: () {
              context.read<ProviderClass>().changeWeight(1);
            },
            child: Text(
              "Bugun",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: context.watch<ProviderClass>().todayWeight,
                    fontSize: width * 0.043,
                  ),
            ),
          ),
          const SizedBox(width: 20.0),
          // ================== Kecha ==================
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ProviderClass>().changeWeight(2);
                },
                child: Text(
                  context.watch<ProviderClass>().dropdownValue,
                  // textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: context.watch<ProviderClass>().dayWeight,
                        fontSize: width * 0.043,
                      ),
                ),
              ),
              PopupMenuButton(
                onSelected: (String? value) {
                  context.read<ProviderClass>().changeDropDownValue(value!);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: ColorClass.black,
                ),
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      value: "Kecha",
                      child: Text("Kecha"),
                    ),
                    PopupMenuItem(
                      value: "Dushanba",
                      child: Text("Dushanba"),
                    ),
                    PopupMenuItem(
                      value: "Seshanba",
                      child: Text("Seshanba"),
                    ),
                    PopupMenuItem(
                      value: "Chorshanba",
                      child: Text("Chorshanba"),
                    ),
                    PopupMenuItem(
                      value: "Payshanba",
                      child: Text("Payshanba"),
                    ),
                    PopupMenuItem(
                      value: "Juma",
                      child: Text("Juma"),
                    ),
                  ];
                },
              ),

              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.arrow_downward,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
