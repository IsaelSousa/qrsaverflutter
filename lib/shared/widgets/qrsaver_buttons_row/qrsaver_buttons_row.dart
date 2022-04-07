import 'package:flutter/material.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';
import 'package:qrsaver/shared/widgets/qrsaver_button/qrsaver_button.dart';

class QRSaverButtonsRow extends StatelessWidget {
  final String primaryTitle;
  final String primaryIcon;
  final VoidCallback primaryOnpressed;
  final bool primaryDisable;

  final String secondaryTitle;
  final String secondaryIcon;
  final VoidCallback secondaryOnpressed;
  final bool secondaryDisable;

  final String thirdTitle;
  final String thirdIcon;
  final VoidCallback thirdOnpressed;
  final bool thirdDisable;

  const QRSaverButtonsRow({ 
    Key? key,
    required this.primaryTitle, required this.primaryIcon, required this.primaryOnpressed, required this.primaryDisable,
    required this.secondaryTitle, required this.secondaryIcon, required this.secondaryOnpressed, required this.secondaryDisable,
    required this.thirdTitle, required this.thirdIcon, required this.thirdOnpressed, required this.thirdDisable,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            QRSaverButton(
              title: primaryTitle,
              icon: primaryIcon,
              onPressed: primaryOnpressed,
              disable: primaryDisable),
              
            QRSaverButton(
              title: secondaryTitle,
              icon: secondaryIcon,
              onPressed: secondaryOnpressed,
              disable: secondaryDisable,),

            QRSaverButton(
              title: thirdTitle,
              icon: thirdIcon,
              onPressed: thirdOnpressed,
              disable: thirdDisable,),            
          ],
        ),
      ),
    );
  }
}