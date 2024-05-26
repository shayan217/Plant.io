// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/sizebox.dart';
import 'package:transparent_image/transparent_image.dart';

class CarouselCard extends StatelessWidget {
  String image;
  CarouselCard({required this.image ,super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
    
      elevation: 0.3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          color:AppColor.carosuelBgColor

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get special discount",
                      style: TextStyle(
                          fontSize: size.width*0.04 ,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Upto 35%",
                      style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.w600, fontSize: size.width*0.08),
                    ),
                    10.ph,


                    Container(
                      height: size.height*0.04,
                      width: size.width*0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(child: Text("Shop now", style: TextStyle(fontSize: size.width*0.035, fontWeight: FontWeight.w500),)),
                    )


                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: image,
                    width: size.width*1,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

