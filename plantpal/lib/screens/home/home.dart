// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:plantpal/models/category_model/category_model.dart';
import 'package:plantpal/models/products_model/products_model.dart';
import 'package:plantpal/provider/app_provider.dart';
import 'package:plantpal/screens/product_details/product_details.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/asset_images.dart';
import 'package:plantpal/utils/routes.dart';
import 'package:plantpal/utils/sizebox.dart';
import 'package:plantpal/widgets/cards/accessories_card.dart';
import 'package:plantpal/widgets/cards/carousel_card.dart';
import 'package:plantpal/widgets/cards/category_card.dart';
import 'package:plantpal/widgets/cards/product_card.dart';
import 'package:plantpal/widgets/textfields/custom_searchField.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///variables, lists, controllers
  bool isLoading = false;
  List<CategoryModel> categoryList = [];
  List<ProductModel> topProductsList = [];
  List<ProductModel> accessoriesList = [];
  List<ProductModel> filteredProducts = [];
  TextEditingController searchController = TextEditingController();


  ///fetch categories and products
  getProductData() async {
    setState(() {
      isLoading = true;
    });

    categoryList = await FirebaseFirestoreHelper.instance.getCategories();
    accessoriesList =
        await FirebaseFirestoreHelper.instance.getAccessoryProducts();
    topProductsList =
        await FirebaseFirestoreHelper.instance.getTopSellingProducts();
    topProductsList.shuffle();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getProductData();
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
  }

  @override
  Widget build(BuildContext context) {
    ///mediaquery
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        //appbar here
        appBar: AppBar(
          title: Image.asset(
            AssetImages().appBarLogo,
            width: size.width * 0.35,

          
          ),
          surfaceTintColor: Colors.transparent,
          actions: [

            ///badge code here
            Consumer<AppProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: badges.Badge(
                  showBadge: value.cartProdcutList.isEmpty ? false : true,
                  badgeStyle: badges.BadgeStyle(
                    padding: const EdgeInsets.all(5),
                    badgeColor: AppColor.secondaryColor,
                  ),
                  badgeContent: Text(
                    value.badgeNum.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: Icon(EneftyIcons.shopping_bag_bold,
                      color: AppColor.iconColor),
                ),
              ),
            )
          ],
        ),

        ///body here
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            filteredProducts = topProductsList
                                .where((product) => product.name
                                    .toLowerCase()
                                    .contains(
                                        searchController.text.toLowerCase()))
                                .toList();
                          });
                        },

                      ),



                      5.ph,

                      ///carousel slider here
                      SizedBox(
                        width: double.infinity,
                        height: size.height*0.22,
                        child: Swiper(
                          physics: const BouncingScrollPhysics(),
                          autoplay: true,
                          autoplayDisableOnInteraction: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Routes.push(
                                  ProductDetail(
                                      singleProduct: topProductsList[index]),
                                  context),
                              child: CarouselCard(
                                image: topProductsList[index].image,
                              ),
                            );
                          },
                          pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  size: 5,
                                  activeSize: 6,
                                  color: Colors.grey,
                                  activeColor: AppColor.primaryColor)),
                          control: SwiperControl(
                              color: AppColor.secondaryColor,
                              size: 20,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10)),
                        ),
                      ),

                      20.ph,



                      10.ph,


                      Text("Categories",
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w600,
                          )),

                      5.ph,

                      SizedBox(
                        height: size.height*0.06,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: categoryList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              catName: categoryList[index].name,
                              catImage: categoryList[index].image,
                              onPress: categoryList[index],
                            );
                          },
                        ),
                      ),

                      20.ph,

                      Text("Gardening Tools",
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w600,
                          )),

                      SizedBox(
                        height: size.height*0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: accessoriesList
                              .where(
                                  (element) => element.category == "accessory")
                              .length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final filteredAccessories = accessoriesList
                                .where((element) =>
                                    element.category == "accessory")
                                .toList();

                            return AccessoriesCard(
                              accessName: filteredAccessories[index].name,
                              accessCategory: "Accessories",
                              accessImage: filteredAccessories[index].image,
                              accessPrice: filteredAccessories[index].price,
                              onPress: filteredAccessories[index],
                            );
                          },
                        ),
                      ),


                      20.ph,

                      ///top selling and icon
                      Text("Top Selling",
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w600,
                          )),

                      5.ph,

                      ///top selling gridview cards
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65),
                        itemCount: filteredProducts.isEmpty
                            ? topProductsList.length
                            : filteredProducts.length,
                        itemBuilder: (context, index) {
                          ProductModel singleProduct = filteredProducts.isEmpty
                              ? topProductsList[index]
                              : filteredProducts[index];
                          return ProductCard(
                            prodName: singleProduct.name,
                            prodImage: singleProduct.image,
                            prodPrice: singleProduct.price,
                            prodCategory: singleProduct.category,
                            prodUsageSpecies: singleProduct.usageSpecies,
                            onPress: singleProduct,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),

      ),
    );
  }
}
