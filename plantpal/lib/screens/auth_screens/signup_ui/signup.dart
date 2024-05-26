// ignore_for_file: use_build_context_synchronously


import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:plantpal/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:plantpal/utils/app_colors.dart';
import 'package:plantpal/utils/asset_images.dart';
import 'package:plantpal/utils/constants.dart';
import 'package:plantpal/utils/routes.dart';
import 'package:plantpal/widgets/primary_btn.dart';
import 'package:plantpal/widgets/textfields/custom_pwField.dart';
import 'package:plantpal/widgets/textfields/custom_textfield.dart';
import 'package:plantpal/widgets/top_titles.dart';
import '../login_ui/login.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  ///controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override

  Widget build(BuildContext context) {


  ///variables
  bool isVisible = false;
  final size = MediaQuery.of(context).size;

    return Scaffold(
      ///appbar here
      appBar: AppBar(),

      ///body here
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///logo
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Center(
                      child: Image.asset(AssetImages().appLogo,width: size.width * 0.3,),
                    ),
                  ),

                  ///titles
                  Toptitles(
                    primary: "SignUp",
                    secondary: "Welcome to BuyBuddy",
                  ),
                  const SizedBox(
                    height: 25,
                  ),


                  ///credential fields
                  CustomTextField(
                    prefixIcon: EvaIcons.personOutline,
                    controller: nameController,
                    hintText: "Name",
                    keyboadType: TextInputType.text,
                  ),
                  CustomTextField(
                    prefixIcon: EvaIcons.emailOutline,
                    controller: emailController,
                    hintText: "Email",
                    keyboadType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    prefixIcon: EvaIcons.phoneOutline,
                    controller: phoneController,
                    hintText: "Phone",
                    keyboadType: TextInputType.phone,
                  ),
                  CustomPasswordField(
                    textEditingController: passwordController,
                    isVisible: isVisible,
                  ),
                  const SizedBox(height: 15,
                  ),



                  ///create account button
                  PrimaryButton(
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () async {
                        bool isValidated = signUpValidation(emailController.text,passwordController.text,nameController.text,phoneController.text);
                        if (isValidated) {
                          bool isSignedUp = await FireBaseAuthHelper.instance.signUp(emailController.text,passwordController.text,nameController.text,context);
                          if (isSignedUp) {
                            Routes.push(const LoginScreen(), context);
                            showMessage("Account created sucessfully!");
                          }
                        }
                      },
                      title: "Create an account"
                    ),
                  const SizedBox(
                    height: 15,
                  ),


                  ///already have an account text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(fontSize: size.width * 0.045)),
                      TextButton(
                          onPressed: () {
                            Routes.pushAndRemoveUntill(const LoginScreen(), context);
                          },

                          child: Text(
                            "Login",
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
