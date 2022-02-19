import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({ Key? key }) : super(key: key);

  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primary,
            leading: const BackButton(color: Colors.white,)
          ),
        ),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                      ),

                      Positioned(
                        top: 20,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('QR Saver Screen', 
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 400,
                        height: 400,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}