import 'package:flutter/material.dart';
import 'package:movie_flix_app/utils/colors.dart';

class IconWithText extends StatelessWidget {
  final String imagePath;
  final String text;

  const IconWithText({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          imagePath,
          width: 24,
          height: 24,
          fit: BoxFit.fill,
        ),
        // SizedBox(height: size.height * 0.02),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            color: whiteColor,
          ),
        ),
      ],
    );
  }
}
