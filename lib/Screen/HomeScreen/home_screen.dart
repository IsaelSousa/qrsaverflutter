import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';
import 'package:qrsaver/shared/styles/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    const text = 'Paje Da Tribo';
    final split = text.split(' ');

    int qtd = 999;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            color: AppColors.primary,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                              )
                            ]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20), // Image border
                            child: SizedBox.fromSize(
                            size: const Size.fromRadius(35), // Image radius
                            child: Image.network('https://github.com/IsaelSousa.png', fit: BoxFit.cover),
                              ),
                            ),
                        ),
                      ),

                      Text.rich(
                        TextSpan(text: 'Olá, ', style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                          children:  [
                            TextSpan(text: '${split[0]} \n', style: const TextStyle(
                              fontWeight: FontWeight.w900
                            )),
                            const TextSpan(text: 'Boa noite!', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ))
                          ]
                        )
                      ),

                      // Text(split[0], style: const TextStyle(
                      //   fontSize: 24,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.white
                      //       ),
                      //     )

                        ],
                      ),

                      GestureDetector(
                        onTap: (){
                          print("OK");
                        },
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: const BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: SvgPicture.asset(
                                AppImages.logoutbutton,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )

                ],
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.background,

        body: Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.primary,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            child: Column(
              children: [

            SizedBox(
              height: 100,
              child: Stack(
                children: [

                  Padding(
                  padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      width: 350,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: const Center(
                        child: Text('Meus Savers', style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 45,
                    right: qtd > 99 ? 2 : 5,
                    child: Container(
                      width: qtd > 99 ? 80 : 70,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Center(child: Text('qtd. $qtd', style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ]
              ),
            ),

              ],
            ),
          ),
        ),
      bottomNavigationBar: Container(
        height: 100,
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                height: 65,
                width: 65,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.addbuton,
                    height: 40,
                    width: 40,
                    color: Colors.white,
                    allowDrawingOutsideViewBox: true,
                  )
                ),
              ),

              Container(
                height: 65,
                width: 65,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.homebutton,
                    width: 40,
                    height: 40,
                    color: Colors.white,
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/qrcodescannerscreen');
                },
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.camerabutton,
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                  ),                
                ),
              )

            ],
          ),
        ),
      ),
      )
    );
  }
}