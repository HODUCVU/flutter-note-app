import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Handle {
  //theme
  static final lightTheme = ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.blue[100],
      colorScheme: const ColorScheme.light(),
      iconTheme: const IconThemeData(color: Colors.black, opacity: 1),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.orange,
        textTheme: ButtonTextTheme.primary,),
    );
  static  final darkTheme = ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.orange,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: const ColorScheme.dark(),
      iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 1),
    );
  static  void handleMenuItemClick(String menuItem) {
    // Handle menu item click based on the selected item
    print("Selected item: $menuItem");
    switch(menuItem) {
      case 'Logout':
      // Move to Signin layout
        break;
      case 'More info':
      // Open link
       _launchURL('https://www.facebook.com/profile.php?id=100013784401133');
        break;
      case 'Help':
      // Open link
        break;
      default:
    }
  }
  static void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}