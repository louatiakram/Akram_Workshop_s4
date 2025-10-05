import 'package:flutter/material.dart';
import 'package:gstore_esprit/pages/CartPage.dart';
import 'package:gstore_esprit/pages/ProfileSettings.dart';
import 'package:gstore_esprit/pages/ResetPassword.dart';

import 'pages/library/my_games.dart';
import 'pages/product_details.dart';
import 'pages/signup.dart';
import 'pages/signin.dart';
import 'pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Workshops 5GamiX", //home: Home()
        home: CartPage()
        // home: Signin()
        // home: MyGames()
        // home: ProductDetails(
        //     "assets/images/dmc5.jpg",
        //     "Devil May Cry 5",
        //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
        //         "sed do eiusmod tempor incididunt ut "
        //         "labore et dolore magna aliqua. Ut enim ad minim veniam, "
        //         "quis nostrud exercitation ullamco laboris nisi ut "
        //         "aliquip ex ea commodo consequat. Duis aute irure dolor "
        //         "in reprehenderit in voluptate velit esse cillum dolore "
        //         "eu fugiat nulla pariatur. Excepteur sint occaecat "
        //         "cupidatat non proident, sunt in culpa qui officia "
        //         "deserunt mollit anim id est laborum.",
        //     200, 3000)
        );
  }
}
