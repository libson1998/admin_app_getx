import 'package:adminapp/theme/theme.dart';
import 'package:flutter/material.dart';

class LoaderButtonWidget extends StatelessWidget {
  final double width;
  final double height;

  const LoaderButtonWidget(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.08),
          end: Alignment(-1, -0.08),
          colors: [greyColor, greyColor],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Center(
        child: SizedBox(
            height: 14,
            width: 14,
            child: CircularProgressIndicator(
              color: buttonColor,
            )),
      ),
    );
  }
}
