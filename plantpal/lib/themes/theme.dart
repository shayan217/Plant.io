import 'package:flutter/material.dart';
import 'package:plantpal/utils/app_colors.dart';

ThemeData lightTheme(){

  return ThemeData(
      // primarySwatch: Colors.blue,
  // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
 useMaterial3: true,
 fontFamily: "Noto Sans",
 scaffoldBackgroundColor: AppColor.scaffoldColor,
 primaryColor: AppColor.primaryColor,
 elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    )

    
  )
 ),

 progressIndicatorTheme: ProgressIndicatorThemeData(
  color: AppColor.primaryColor
 ),
 
 
 outlinedButtonTheme: OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    side: BorderSide(
      color: AppColor.secondaryColor,
    )
  )
 ),

 cardTheme: CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  )
 ),


 appBarTheme: AppBarTheme(
  backgroundColor: AppColor.scaffoldColor,
  iconTheme: IconThemeData(
    color: AppColor.primaryColor  
  ),
  surfaceTintColor: Colors.transparent,
 ),

 textSelectionTheme: TextSelectionThemeData(
  cursorColor: AppColor.primaryColor
 ),

 dialogBackgroundColor: AppColor.imgBgColor,

 
  );

}



// ThemeData darkTheme(){

//   return ThemeData.dark().copyWith(

//      useMaterial3: true,
//  scaffoldBackgroundColor: DarkAppColor.scaffoldColor,
//  primaryColor: DarkAppColor.primaryColor,
//  elevatedButtonTheme: ElevatedButtonThemeData(
//   style: ElevatedButton.styleFrom(
//     backgroundColor: AppColor.primaryColor,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10)
//     )

    
//   )
//  ),

//  progressIndicatorTheme: ProgressIndicatorThemeData(
//   color: DarkAppColor.primaryColor
//  ),
 
 
//  outlinedButtonTheme: OutlinedButtonThemeData(
//   style: OutlinedButton.styleFrom(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10)
//     ),
//     side: BorderSide(
//       color: DarkAppColor.secondaryColor,
//     )
//   )
//  ),

//  cardTheme: CardTheme(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(10)
//   )
//  ),


//  appBarTheme: AppBarTheme(
//   backgroundColor: DarkAppColor.scaffoldColor,
//   iconTheme: IconThemeData(
//     color: DarkAppColor.primaryColor  
//   ),
//   surfaceTintColor: Colors.transparent,
//  ),

//  textSelectionTheme: TextSelectionThemeData(
//   cursorColor: DarkAppColor.primaryColor
//  ),


//  cardColor: DarkAppColor.imgBgColor


//   );
// }






   
