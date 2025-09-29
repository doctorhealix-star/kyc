import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyc/core/services/location/mapscreen.dart';
import 'package:path/path.dart';

import '../ui/screens/aboutscreen/about.dart';
import '../ui/screens/bottombar/bottombar.dart';
import '../ui/screens/homescreen/homescreen.dart';
import '../ui/screens/notificationscreen/notificationscreen.dart';

import '../ui/screens/profilescreen/profilescreen.dart';
import '../ui/screens/termsandconditions/terms.dart';
import '/ui/screens/kycsecondscreen/kycsecondscreen.dart';
import '/ui/screens/kyc/kyc.dart';

import '/ui/screens/otpscreens/otpscreens.dart';
import '/ui/screens/loginscreen/mobileloginscreen.dart';


import '/ui/screens/loginscreen/loginscreen.dart';
import '/ui/screens/splashscreen.dart';
import '/core/constant/string.dart';

class  Routes{
  static Route<dynamic>onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case splash :
        return CupertinoPageRoute(builder: (context)=>Splashscreen());
      case home :
        return CupertinoPageRoute(builder: (context)=>Homescreen());
      case login:
        return CupertinoPageRoute(builder: (context)=>Loginscreen());
      case mobilelogin:
        return _slideUpRoute(Mobileloginscreen());
      case otp:
        return CupertinoPageRoute(builder: (context)=>OptScreen());
      case profile:
        return CupertinoPageRoute(builder: (context)=>Profilescreen());
      case kyc2:
         return CupertinoPageRoute(builder: (context)=>kycSecondScreen());
      case maps:
        return CupertinoPageRoute(builder: (context)=>Mapscreen());
      case notification:

    return CupertinoPageRoute(builder:(context)=>NotificationScreen());
      case bottombar:
        return CupertinoPageRoute(builder: (context)=>Bottombar());

      case terms:
        return CupertinoPageRoute(builder: (context)=>TermsPolicyScreen());
      case about:
        return CupertinoPageRoute(builder: (context)=>AboutScreen());
      case kyc:
        return CupertinoPageRoute(builder: (context)=>KYC());
      default:
      // Default / Unknown route
        return CupertinoPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ),
        );
    }

  }
  static PageRouteBuilder _slideUpRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(0, 1), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
