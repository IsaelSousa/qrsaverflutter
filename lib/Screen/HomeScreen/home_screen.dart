import 'package:flutter/material.dart';
import 'package:qrsaver/shared/styles/app_colors.dart';

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

    return SafeArea(
      child: Scaffold(
        
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            color: AppColors.primary,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Image border
                          child: SizedBox.fromSize(
                          size: const Size.fromRadius(30), // Image radius
                          child: Image.network('https://github.com/IsaelSousa.png', fit: BoxFit.cover),
                            ),
                          ),
                      ),

                      Text(split[0], style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                            ),
                          )
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
                          child: Image.asset('assets/images/loggouticon.png', width: 30, height: 30,),
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
                    right: 5,
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: const Center(child: Text('qtd. 1', style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                height: 75,
                width: 75,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: const Center(
                  child: Icon(Icons.add),
                ),
              ),

              Container(
                height: 75,
                width: 75,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),

              Container(
                height: 75,
                width: 75,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20))
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