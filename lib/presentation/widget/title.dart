import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final double width;
  const TitleWidget({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: width * 0.035),
          Container(
            height: width * 0.1,
            width: width * 0.1,
            decoration: const BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/apple.png",
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            height: width * 0.1,
            alignment: Alignment.center,
            child: Text(
              " Eda AI",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: width * .085,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
