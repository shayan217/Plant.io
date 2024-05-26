import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:plantpal/models/category_model/category_model.dart';
import 'package:plantpal/screens/catalouge/catalouge_list/catalouge_list.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/routes.dart';

class CatalougeScreen extends StatefulWidget {
  const CatalougeScreen({super.key});

  @override
  State<CatalougeScreen> createState() => _CatalougeScreenState();
}

class _CatalougeScreenState extends State<CatalougeScreen> {
  bool isLoading = false;
  List<CategoryModel> categoryList = [];

  ///fetch categories and products
  getCategories() async {
    setState(() {
      isLoading = true;
    });

    categoryList =
        await FirebaseFirestoreHelper.instance.getCatalougeCategories();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title:
              Text("Catalouge", style: TextStyle(color: AppColor.primaryColor)),
          centerTitle: true,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            
            
                    ///1st catalouge
                    Expanded(
                      child: GestureDetector(
                      onTap: () {
                        Routes.push(
                            CatalougeList(categoryModel: categoryList[0]),
                            context);
                       },
                        child: SizedBox(
                          width: size.width,
                          child: Card(
                            
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                color: AppColor.imgBgColor,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    categoryList[0].image,
                                  )
                                ),
                      
                                borderRadius:BorderRadius.circular(10)
                              ),
                              child: Center(child: Text(categoryList[0].name, style: TextStyle(color: Colors.white, fontSize: size.width*0.08 ,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                        ),
                      )),









                    Expanded(
                      child: GestureDetector(
                      onTap: () {
                        Routes.push(
                            CatalougeList(categoryModel: categoryList[1]),
                            context);
                       },
                        child: SizedBox(
                          width: size.width,
                          child: Card(
                            child: Container(
                              
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                color: AppColor.imgBgColor,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    categoryList[1].image,
                                  )
                                ),
                      
                                borderRadius:BorderRadius.circular(10)
                              ),
                              child: Center(child: Text(categoryList[1].name, style: TextStyle(color: Colors.white, fontSize: size.width*0.08 ,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                        ),
                      )),


                                          Expanded(
                      child: GestureDetector(
                      onTap: () {
                        Routes.push(
                            CatalougeList(categoryModel: categoryList[2]),
                            context);
                       },
                        child: SizedBox(
                          width: size.width,
                          child: Card(
                            child: Container(
                              
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                color: AppColor.imgBgColor,
                                image: DecorationImage(
                                  
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    categoryList[2].image,
                                  )
                                ),
                      
                                borderRadius:BorderRadius.circular(10)
                              ),
                              child: Center(child: Text(categoryList[2].name, style: TextStyle(color: Colors.white, fontSize: size.width*0.08 ,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                        ),
                      )),




                  ],
                ),
            ));
  }
}
