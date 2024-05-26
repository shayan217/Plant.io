
import 'package:flutter/material.dart';
import 'package:plantpal/screens/auth_screens/login_ui/login.dart';
import 'package:plantpal/screens/auth_screens/signup_ui/signup.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/asset_images.dart';
import 'package:plantpal/utils/constants.dart';
import 'package:plantpal/utils/routes.dart';
import 'package:plantpal/utils/sizebox.dart';




class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      body: Padding(
        padding:   const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(
                    AssetImages().appLogo,
                    width: size.width*0.15,
                  ),

                  15.ph,
                              Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Center(
                child: Image.asset(
                  "assets/images/plants.png",
                  width: size.width * 1,
                ),
              ),
            ),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                
                text: "Discover the ",
                style: TextStyle(color: Colors.black, fontSize: size.width*0.07, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "Perfect Plant ",
                    style: TextStyle(color: AppColor.primaryColor, fontSize: size.width*0.07, fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text: "for your space!",
                    style: TextStyle(color: Colors.black, fontSize: size.width*0.07, fontWeight: FontWeight.bold),
                  )
                ]
              ),
            ),



            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              AppConstants.aboutApp,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width*0.045,
                color: AppColor.subTitleColor
              ),
            ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                              SizedBox(
              height: 50,
              width: size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor
                ),
                onPressed: () {

                  Routes.push(const SignUpScreen(), context);

                },
                
                child: Text("Get started",style: TextStyle(color: Colors.white, fontSize: size.width*0.045),),
              ),
            ),
            15.ph,


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",style: TextStyle(fontSize: size.width*0.05, fontWeight: FontWeight.w400, color: Colors.grey),),
                TextButton(
                  child: Text("Login", style: TextStyle(color: AppColor.primaryColor, fontSize: size.width*0.05, fontWeight: FontWeight.bold),),
                  onPressed: () {
                    Routes.push(const LoginScreen(), context);
                  },
                )
              ],
            )
                ],
              ),
            )






            
            // SizedBox(
            //   height: 50,
            //   width: size.width,
            //   child: OutlinedButton(
            //     onPressed: () { 
            //       Routes.push(const SignUpScreen(), context);  
            //     },
            //     style: OutlinedButton.styleFrom(
            //       backgroundColor: AppColor.scaffoldColor,
            //       side: BorderSide(color: AppColor.secondaryColor, width: 1.5)
            //     ),
            //     child: Text("SignUp",style: TextStyle(color: AppColor.secondaryColor, fontWeight: FontWeight.bold),),
            //   ),
            // )




          ],
        ),
      ),
    );
  }
}