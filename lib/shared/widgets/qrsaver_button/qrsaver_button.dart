import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';


class QRSaverButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;


  const QRSaverButton({
    Key? key,
    required this.title,
    required this.icon, 
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 110,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SvgPicture.asset(
                icon, 
                height: 40,
                width: 40,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
