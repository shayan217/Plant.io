
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantpal/models/catalouge_model/catalouge_model.dart';
import 'package:plantpal/models/category_model/category_model.dart';
import 'package:plantpal/models/order_model/order_model.dart';
import 'package:plantpal/models/products_model/products_model.dart';
import 'package:plantpal/models/user_model/user_model.dart';
import 'package:plantpal/utils/constants.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }






    Future<List<CategoryModel>> getCatalougeCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("catalouge").get();

      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }



    Future<List<CatalougeModel>> getCatalougeItems(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("catalouge").doc(id).collection("details").get();

      List<CatalougeModel> catalougeItems = querySnapshot.docs
          .map((e) => CatalougeModel.fromJson(e.data()))
          .toList();
          

      return catalougeItems;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }  

    Future<List<ProductModel>> getCategoryProducts(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").doc(id).collection("items").get();

      List<ProductModel> categoryProducts = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
          

      return categoryProducts;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }  

    Future<List<ProductModel>> getTopSellingProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("items").get();

      List<ProductModel> bestSellingProducts = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return bestSellingProducts;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }



    Future<List<ProductModel>> getAccessoryProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("items").get();

      List<ProductModel> getAccessoryProducts = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return getAccessoryProducts;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }







  Future<UserModel> getUserInfo() async {

      DocumentSnapshot<Map<String, dynamic>> docSnapshot = await _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
      return UserModel.fromJson(docSnapshot.data());


  }  


  ///post order on firebase
  

  Future<bool> postOrderedItemFirebase(List<ProductModel> list, BuildContext context, String payment )async{

    try {

      showLoaderDialog(context);

      double totalPrice = 0.00;
      for(var element in list){

        var qty = element.quantity!.toDouble();
        var price= double.parse(element.price);

        totalPrice += price * qty;
      }

      DocumentReference documentReference =_firebaseFirestore.collection("userOrders")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("orders")
      .doc();

      documentReference.set({
        "products" : list.map((e) => e.toJson()),
        "status": "pending",
        "totalPrice": totalPrice,
        "payment":payment,
        "orderId":documentReference.id
      });

      Navigator.of(context, rootNavigator: true).pop();
      DocumentReference adminReference= _firebaseFirestore
      .collection("orders")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("orders")
      .doc();


      adminReference.set({
        "products" : list.map((e) => e.toJson()),
        "status": "pending",
        "totalPrice": totalPrice,
        "payment":payment,
        "orderId":adminReference.id
      });

      showMessage("Ordered successfully!");

      return true;

    } catch (e) {

      showMessage(e.toString());
      Navigator.of(context, rootNavigator: true).pop();

      return false;
    }

  }



  ////get orders of user
  Future<List<OrderModel>> getUserOrder()async{

    try {

    QuerySnapshot<Map<String,dynamic>> querySnapshot =await _firebaseFirestore
    .collection("userOrders")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("orders")
    .get();


    List<OrderModel> orderList = querySnapshot.docs.map((e) => OrderModel.fromJson(e.data())).toList();


    return orderList;

    
    } catch (e) {
      showMessage(e.toString());
      return [];
      
    }

    
  }









}
