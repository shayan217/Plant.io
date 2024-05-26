// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:plantpal/screens/custom_navbar/custom_navbar.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/asset_images.dart';
import 'package:plantpal/utils/constants.dart';
import 'package:plantpal/utils/sizebox.dart';
import 'package:plantpal/widgets/primary_btn.dart';
import 'package:plantpal/widgets/textfields/custom_pwField.dart';
import 'package:plantpal/widgets/textfields/custom_textfield.dart';
import 'package:plantpal/widgets/top_titles.dart';
import '../../../utils/routes.dart';
import '../signup_ui/signup.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {

  ///text controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ///variables
    final size = MediaQuery.of(context).size;
    bool isVisible = false;

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Center(
                      child: Image.asset(
                        AssetImages().appLogo,
                        width: size.width * 0.3,
                      ),
                    ),
                  ),

                  /////titles
                  Toptitles(
                    primary: "Login",
                    secondary: "Welcome back you've been missed",
                  ),
                  25.ph,

                  ////email password fields
                  CustomTextField(
                    prefixIcon: EvaIcons.emailOutline,
                    controller: emailController,
                    hintText: "Email",
                    keyboadType: TextInputType.emailAddress,
                  ),
                  CustomPasswordField(
                      textEditingController: passwordController,
                      isVisible: isVisible),
                  15.ph,


                  ///sign in button
                  PrimaryButton(
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () async {
                        bool isValidated = loginValidation(emailController.text, passwordController.text);
                        if (isValidated) {
                          bool isLogined = await FireBaseAuthHelper.instance.login(emailController.text,passwordController.text, context);
                          if (isLogined) {
                            Routes.pushAndRemoveUntill(const CustomBottomNavBar(), context);
                            showMessage("User logged in");
                          }
                        }
                      },
                      title: "Sign in"
                    ),
                    15.ph,



                  ////dont have an account text and button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?",style: TextStyle(fontSize: size.width * 0.045),),
                      TextButton(
                          onPressed: () {
                            Routes.push(const SignUpScreen(), context);
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.primaryColor,
                                decorationThickness: 2),
                          )
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
