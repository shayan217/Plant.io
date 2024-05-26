
import 'package:firebase_core/firebase_core.dart';
import 'package:plantpal/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:plantpal/provider/app_provider.dart';
import 'package:plantpal/screens/custom_navbar/custom_navbar.dart';
import 'package:plantpal/screens/splash_screen/splash_screen.dart';
import 'package:plantpal/screens/welcome/welcome.dart';
import 'package:plantpal/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; 


void main()async{

    // Set the preferred orientations to portrait only



  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();




    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const PlantPal());
}


class PlantPal extends StatelessWidget {
  const PlantPal({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: "BuyBuddy",
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FireBaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Splash(screen: const CustomBottomNavBar());
            }
            else{
              return Splash(screen: const WelcomeScreen());
            }
          },
        ),
      ),
    );
  }
}