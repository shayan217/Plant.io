
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/asset_images.dart';
import 'package:plantpal/utils/sizebox.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ///variables
    final size = MediaQuery.of(context).size;
    return Scaffold(

      ///APPBAR
      appBar: AppBar(
        title: Text("About Us",style: TextStyle(color: AppColor.primaryColor),),
        centerTitle: true,
      ),


      ///BODY
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ///1st card
            Card(
              elevation: 0,
              color: AppColor.imgBgColor,
              child: SizedBox(
                height: size.height * 0.2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetImages().appLogo,
                        width: size.width * 0.2,
                      ),
                      5.ph,
                      const Text("Version 1.0.1",style: TextStyle(color: Colors.black),),

                    ],
                  ),
                ),
              ),
            ),

            ///2nd card
            Card(
              color: AppColor.imgBgColor,
              elevation: 0,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.4,
                child: Column(
                  children: [
                    10.ph,
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor, shape: BoxShape.circle),

                      ///CIRCLE AVATAR    
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(AssetImages().teamlogo),
                      ),
                    ),
                    8.ph,
                    Text("Designed & Developed by",style: TextStyle(color: Colors.black87, fontSize: size.width * 0.042),),
                    5.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(EneftyIcons.user_bold,color: AppColor.primaryColor,),
                        5.pw,
                        Text("MSG-App Warriors",style: TextStyle(color: Colors.black87,fontSize: size.width * 0.042),)
                      ],
                    ),
                    5.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(EneftyIcons.location_bold,color: AppColor.secondaryColor),
                        5.pw,
                        Text("Karachi, Pakistan",style: TextStyle(color: Colors.black87,fontSize: size.width * 0.042),)
                      ],
                    ),
                    25.ph,


                    ///social media buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(FontAwesomeIcons.facebook,color: const Color(0xff3B5998),size: size.width * 0.08),
                            onPressed: () async {
                              await launchUrl(Uri.parse("https://www.facebook.com/axhir.ali/"),mode: LaunchMode.externalApplication);
                            }),


                        IconButton(icon: Icon(FontAwesomeIcons.github,color: Colors.black, size: size.width * 0.08),
                          onPressed: () async {
                            await launchUrl(Uri.parse("http://www.github.com/ashir98"),mode: LaunchMode.externalNonBrowserApplication);
                          },
                        ),


                        IconButton(icon: Icon(FontAwesomeIcons.youtube,color: Colors.red, size: size.width * 0.08),
                          onPressed: () async {
                            await launchUrl(
                                Uri.parse("http://www.youtube.com/c/AshxGamer98",),
                                mode: LaunchMode.externalApplication);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
