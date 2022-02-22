import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';
import 'package:qrsaver/shared/styles/app_images.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({ Key? key }) : super(key: key);

  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if ( Platform.isAndroid ){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

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

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 325 ,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: buildQrView(context),
                          ),
                        ),
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

                    ],
                  ),
                ),

                Center(
                  child: buildResult(),
                )

              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: AppColors.background,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                GestureDetector(
                  onTap: () {
                    setState(() {
                    controller?.resumeCamera();
                    });
                  },
                  child: Container(
                    width: 110,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.repeatbutton, width: 40, height: 40,),
                      const Text('Scanear Novamente', textAlign: TextAlign.center ,style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
                    ],
                  ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 110,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      SvgPicture.asset(AppImages.webbutton, width: 40, height: 40,),
                      const Text('Abrir no navegador', textAlign: TextAlign.center ,style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 110,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(AppImages.sharebutton, width: 40, height: 40,),
                      ),
                      const Text('Compartilhar', textAlign: TextAlign.center ,style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)                        
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResult() => Text(
    result != null ? 'Resultado: ${result!.code}' : 'Scaneie aqui! :)',
    maxLines: 3,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20
    ),
  );

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderRadius: 5,
      borderLength: 5,     
      borderWidth: 5
    ),
  );

  void onQRViewCreated(QRViewController controller){
    setState(() => this.controller = controller);

    // Read qrcode
    controller.scannedDataStream.listen((barcode){
      setState(() {
        if (result != null) {
          controller.pauseCamera();
        }
        result = barcode;
      });
    });
  }
}