// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plantpal/models/products_model/products_model.dart';
import 'package:plantpal/screens/product_details/product_details.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/routes.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {

  String prodName;
  String prodImage;
  String prodPrice;
  String prodCategory;
  String prodUsageSpecies;
  ProductModel onPress; 
  ProductCard({super.key, 

    required this.prodName,
    required this.prodImage,
    required this.prodPrice,
    required this.prodCategory,
    required this.prodUsageSpecies,
    required this.onPress
  });

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:() => Routes.push(ProductDetail(singleProduct: onPress), context),
      child: Card(
          color: AppColor.cardBgColor,
          elevation: 0,
          shadowColor: AppColor.primaryColor,
          surfaceTintColor: AppColor.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 5,
                child: Card(
                  elevation: 0,
                  color: AppColor.imgBgColor,
                  child: SizedBox(
                      width: size.width * 0.45,
                      height: size.height*0.165,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: prodImage,
                        fadeInDuration: const Duration(milliseconds: 300),
                      )),
                ),
              ),




              Expanded(
                flex: 3,
                child: Column(
                  children: [
              
                                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prodName,
                        style: TextStyle(fontSize: size.width * 0.045, color: AppColor.titleColor),
                      ),
                      Text(
                       prodCategory=="plant"?prodUsageSpecies:prodCategory,
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            color: AppColor.subTitleColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rs.$prodPrice",
                            style:
                                TextStyle(color: AppColor.primaryColor, fontSize: size.width*0.045, fontWeight: FontWeight.bold),
                          ),
                  
                          ElevatedButton(
                            onPressed: () {
                              Routes.push(ProductDetail(singleProduct: onPress), context);
                            },
                  
                          
                  
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.secondaryLightColor,
                              elevation: 0,
                            
                      
                            ),
                  
                            child: Text("Buy", style: TextStyle(color: AppColor.secondaryColor, fontWeight: FontWeight.w600),),
                          ),
                        ],
                      )
                    ],
                  ),
                )
                  ],
                ),
              )

            ],
          )
        ),
    );
  }
}