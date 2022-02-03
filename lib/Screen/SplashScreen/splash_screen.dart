import 'package:flutter/material.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';
import 'package:qrsaver/shared/styles/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Center(
        child: Container(
          width: 250,
          height: 250,
          child: Image.asset(AppImages.logowhite),
        )
         ),
    );
  }
}