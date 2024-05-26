import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:plantpal/models/order_model/order_model.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/asset_images.dart';
import 'package:plantpal/widgets/cards/order_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders", style: TextStyle(color: AppColor.primaryColor),),
        centerTitle: true,
      ),

      body: FutureBuilder(
        future: FirebaseFirestoreHelper.instance.getUserOrder(),
        builder: (context, snapshot) {

          if(snapshot.connectionState==ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(!snapshot.hasData||snapshot.data!.isEmpty){
            return Center(
              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AssetImages().noOrdersImage,width: 200),
                              Text("No orders found!",style: TextStyle(fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.w600))
                            ],
                          ),
            );

          }



          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
          
                OrderModel orderModel = snapshot.data![index];
          
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ExpansionTile(

                    
                    iconColor: orderModel.products.length>1?AppColor.primaryColor:Colors.transparent,
                    collapsedIconColor: orderModel.products.length>1? AppColor.primaryColor:Colors.transparent,
                    
                    
                    tilePadding: EdgeInsets.zero,
                    collapsedBackgroundColor: AppColor.cardBgColor,
                    backgroundColor: AppColor.cardBgColor,
                
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: AppColor.cardBgColor
                      )
                    ),
                
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: AppColor.cardBgColor
                      )
                    ),
                
                    
                    
                    title: orderModel.products.length>1? 

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("See ordered Items") ,
                    )
                    
                    
                     :  OrderCard(
                      orderImage: orderModel.products[0].image,
                      orderName: orderModel.products[0].name,
                      totalPrice: orderModel.totalPrice.toString(),
                      quantity: orderModel.products[0].quantity.toString(),
                      status: orderModel.status,
                    ),
                          
                    children:orderModel.products.length>1 ? 

                    ///if products are more than one
                    ///
                    ///
                    orderModel.products.map((item){

                      return OrderCard(
                        orderImage: item.image, 
                        orderName: item.name, 
                        totalPrice: item.price, 
                        quantity: item.quantity.toString(), 
                        status: item.status
                      );

                      

                      
                    }).toList()
                    
                    



                    :


                    ///if there is a single product
                    [

                    ]

                          
                  ),
                );
                
              },
            ),
          );
        },
      ),
    );
  }
}