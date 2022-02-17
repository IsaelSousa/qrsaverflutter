import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qrsaver/Screen/LoginScreen/login_controller.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';
import 'package:qrsaver/shared/styles/app_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final login = LoginController();

    return Container(
      color: AppColors.primary,
      child: SizedBox(
        width: size.width,
        height: size.width,
        child: Stack(
          children: [
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Image.asset(AppImages.logowhite, width: 250, height: 250,),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 50,
              child: GestureDetector(
                onTap: () {
                  login.googleSignIn(context);
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          )
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SvgPicture.asset(
                            AppImages.googleicon,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 220,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30),
                          )
                      ),
                      child: const Center(
                        child:  Text(
                          'Entrar com Google',
                          style: TextStyle(
                            fontSize: 22,
                            decoration: TextDecoration.none,
                            color: AppColors.white,
                            fontFamily: 'roboto'
                          ),
                          ),
                      ),
                    )
            
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}