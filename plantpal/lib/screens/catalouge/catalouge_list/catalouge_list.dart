// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:plantpal/models/catalouge_model/catalouge_model.dart';
import 'package:plantpal/models/category_model/category_model.dart';
import 'package:plantpal/screens/catalouge/catalouge_details.dart/catalouge_detail.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/routes.dart';
import 'package:plantpal/widgets/cards/catalouge_card.dart';


class CatalougeList extends StatefulWidget {
  CategoryModel categoryModel;
  CatalougeList({required this.categoryModel, super.key});

  @override
  State<CatalougeList> createState() => _CatalougeListState();
}

class _CatalougeListState extends State<CatalougeList> {
  ///variables
  bool isLoading = false;
  List<CatalougeModel> catalougeItemList = [];

  getCatalougeItems() async {
    setState(() {
      isLoading = true;
    });

    catalougeItemList = await FirebaseFirestoreHelper.instance
        .getCatalougeItems(widget.categoryModel.id);
    catalougeItemList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getCatalougeItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appbar here
      appBar: AppBar(
        title:
            Text("Catalouge", style: TextStyle(color: AppColor.primaryColor)),
        centerTitle: true,
      ),

      ///body here
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :                   ListView.builder(
                    itemCount: catalougeItemList.length,
                    itemBuilder: (context, index) {
                      return CatalougeCard(

                        image: catalougeItemList[index].image,
                        title: catalougeItemList[index].name,
                        subTitle: catalougeItemList[index].category,
                        onPress: () {
                          Routes.push(CatalougeDetails(catalougeItem: catalougeItemList[index]), context);
                        },

                      );
                    },
                  ),
    );
  }
}
// GestureDetector(
//                         onTap: () => Routes.push(CatalougeDetails(catalougeItem: catalougeItemList[index]), context),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: NetworkImage(catalougeItemList[index].image),
//                           ),
//                           title: Text(catalougeItemList[index].name),
//                         ),
//                       )