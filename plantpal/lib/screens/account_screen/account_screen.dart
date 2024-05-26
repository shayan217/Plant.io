
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:plantpal/main.dart';
import 'package:plantpal/provider/app_provider.dart';
import 'package:plantpal/screens/about_screen/about_screen.dart';
import 'package:plantpal/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:plantpal/screens/favourites_screen/favourites_screen.dart';
import 'package:plantpal/screens/order_screen/order_screen.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/constants.dart';
import 'package:plantpal/utils/routes.dart';
import 'package:plantpal/widgets/setting_list_tile.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {

    ///variables
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    
    return Scaffold(

      //appbar code
        appBar: AppBar(
          title: Text("Account",style: TextStyle(color: AppColor.primaryColor)),
          centerTitle: true,
        ),

        //body here
        body: FutureBuilder(
          future: appProvider.getUserInfoFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.3,

                      ///profile card here
                      child: Card(
                        elevation: 0,
                        color: AppColor.imgBgColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(radius: 60,backgroundImage: AssetImage("assets/images/avatar.png")),
                              Text(appProvider.getUserInfo.name,style: TextStyle(color: Colors.black,fontSize: size.width * 0.06)),
                              Text(appProvider.getUserInfo.email,style: TextStyle(color: AppColor.subTitleColor,fontSize: size.width * 0.04)),
                              SizedBox(
                                width: size.width/2.6,
                                child: ElevatedButton(
                              
                                  onPressed:() => Routes.push(EditProfile(name: appProvider.getUserInfo.name), context),
                              
                              
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Edit Profile",style: TextStyle(color: Colors.white)),
                                      
                                      Icon(EneftyIcons.arrow_right_3_outline,color: Colors.white),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),


                    ////account list tiles
                    ///
                    SettingListTile(
                      leading: EneftyIcons.shopping_bag_bold,
                      title: "Your Orders",
                      ontap: () => Routes.push(const OrderScreen(), context),
                    ),
                    SettingListTile(
                      leading: EneftyIcons.heart_bold,
                      title: "Favourites",
                      ontap: () =>
                          Routes.push(const FavouritesScreen(), context),
                    ),
                    SettingListTile(
                      leading: EneftyIcons.info_circle_bold,
                      title: "About us",
                      ontap: () => Routes.push(const AboutScreen(), context),
                    ),
                    SettingListTile(
                      leading: EneftyIcons.a_24_support_bold,
                      title: "Support",
                      ontap: () {},
                    ),
                    SettingListTile(
                      ontap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: AppColor.imgBgColor,
                          title: const Text("Logout"),
                          content: const Text("Are you sure, do you want to Logout?"),
                          actions: [

                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("No",style: TextStyle(color: AppColor.primaryColor, fontSize: 18)),
                            ),

                            TextButton(
                              onPressed: () {
                                FireBaseAuthHelper().signOut();
                                Routes.pushAndRemoveUntill(const PlantPal(), context);
                                showMessage("User logout");
                              },
                              child: Text("Yes",style: TextStyle(color: AppColor.primaryColor, fontSize: 18)),
                            )
                          ],
                        ),
                      ),
                      leading: EneftyIcons.logout_bold,
                      title: "Log out",
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
