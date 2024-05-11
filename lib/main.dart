import 'package:flutter/material.dart';
import 'package:furniture/app/modules/cart/controllers/cart_controller.dart';
import 'package:furniture/app/routes/app_pages.dart';
import 'package:furniture/app/utils/constants.dart';

import 'package:furniture/app/utils/memory_management.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:khalti_flutter/khalti_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Furniture app',
//       theme: ThemeData(
//         // We set Poppins as our default font
//         textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
//         primaryColor: kPrimaryColor,
//         hintColor: kPrimaryColor,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       initialRoute: Routes.LOGIN,
//       getPages: AppPages.routes,
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();
  Get.put(CartController(), permanent: true);
  var token = MemoryManagement.getAccessToken();

  runApp(
    KhaltiScope(
      publicKey: 'test_public_key_ae70966fbc8d4532910eef9169c3e32f',
      builder: (context, navigatorKey) => GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: "Application",
        defaultTransition: Transition.cupertino,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ne', 'NP'),
        ],
        localizationsDelegates: const [
          KhaltiLocalizations.delegate,
        ],
        initialRoute: token == null ? Routes.LOGIN : Routes.MAIN,

        theme: ThemeData(
          // We set Poppins as our default font
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          hintColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        //   (role != null &&

        getPages: AppPages.routes,
      ),
    ),
  );
}
