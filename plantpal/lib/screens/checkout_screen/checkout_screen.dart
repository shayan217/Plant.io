// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:plantpal/models/products_model/products_model.dart';
import 'package:plantpal/provider/app_provider.dart';

import 'package:plantpal/utils/app_colors.dart';

import 'package:plantpal/widgets/cards/payment_card.dart';
import 'package:plantpal/widgets/primary_btn.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  ProductModel singleProduct;
  CheckOut({required this.singleProduct, super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  ///increment variable
  int _selectedOption = 1;

  @override
  void initState() {
    super.initState();
    // Set an initial value for the selected option
    _selectedOption = 1;
  }

  @override
  Widget build(BuildContext context) {
    //provider
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      ///appbar here
      appBar: AppBar(
        title: Text("Checkout", style: TextStyle(color: AppColor.primaryColor)),
        centerTitle: true,
      ),

      ///body here
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ///payment option cards
            PaymentCard(
              icon: "assets/icons/mastercard.svg",
              name: "Online Payment",
              btnValue: 1,
              btnGroupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            PaymentCard(
              icon: "assets/icons/cash.svg",
              name: "Cash on delivery",
              btnValue: 2,
              btnGroupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),

            const Spacer(),

            ///payment button
            PrimaryButton(
              title: "Make payment",
              backgroundColor: AppColor.secondaryColor,
              onPressed: () async {
                
                appProvider.addToBuyItem(widget.singleProduct);
                Future<bool> isOrdered = FirebaseFirestoreHelper.instance
                    .postOrderedItemFirebase(
                        appProvider.getBuyItemList,
                        context,
                        _selectedOption == 1
                            ? "Online Payment"
                            : "Cash on delivery");
                if (await isOrdered) {
                  Future.delayed(const Duration(seconds: 2), () {
                    appProvider.clearBuyProduct();
                    appProvider.clearCart();
                    Navigator.of(context).pop();
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
