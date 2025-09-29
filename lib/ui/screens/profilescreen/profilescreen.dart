import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyc/ui/screens/profilescreen/component/appbarprofile.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  void initState() {
    super.initState();

    // Set status bar style here
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent background
        statusBarIconBrightness: Brightness.dark, // dark icons
        statusBarBrightness: Brightness.light,   // for iOS
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
      double height= MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: primary, // transparent background
          statusBarIconBrightness: Brightness.dark, // dark icons
          statusBarBrightness: Brightness.light,   // for iOS
        ),
      );
    return Scaffold(
      body:AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith( // Change to .light for white icons
          statusBarColor: primary, // transparent status bar
          statusBarIconBrightness: Brightness.dark, // dark icons
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                  right: 0,
                  left: 0,
                  child: Appbarprofile(height: height)),
              Positioned.fill(
                top: height*0.1,
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  ),
                  child:Column(
                    children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:greyshade.withOpacity(0.3))
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.2),
                      //     blurRadius: 8,
                      //     offset: const Offset(2, 4),
                      //   )
                      // ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Avatar
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: greyshade.withOpacity(0.5)),
                          ),
                          child: ClipOval(
                            child: SvgPicture.network(
                              "https://www.svgrepo.com/show/384670/account-avatar-profile-user.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        /// Name + Verified + Subtitle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),

                            /// Name + Verified symbol
                            Row(
                              children: [
                                Text(
                                  'Edmond',
                                  style: b.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Icon(
                                  Icons.verified,
                                  color: Colors.blueAccent,
                                  size: 17,
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            /// Welcome text
                            Text(
                              'Welcome To DoctorHealix',
                              style: b.copyWith(
                                fontWeight: FontWeight.w500,
                                color: grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                      SizedBox(height: 30,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(


                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:greyshade.withOpacity(0.3))
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.2),
                            //     blurRadius: 8,
                            //     offset: const Offset(2, 4),
                            //   )
                            // ],
                          ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                          child: Column(
                            children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Icon(LineIcons.addressBook),
                          //         SizedBox(width: 5,),
                          //         Text('Settings',style:b),
                          //       ],
                          //     ),
                          //     Icon(Icons.arrow_forward_ios_rounded)
                          //   ],
                          // )


                              menus('Terms and policy',LineIcons.connectDevelop,(){

                              }),
                              Divider(color: greyshade.withOpacity(0.3),thickness: 1,),
                              menus('Contact us',LineIcons.phoneSquare,(){

                              }),
                              Divider(color: greyshade.withOpacity(0.3),thickness: 1,),
                              menus('settings',LineIcons.addressBook,(){

                              }),
                              Divider(color: greyshade.withOpacity(0.3),thickness: 1,),
                              menus('Logout',Icons.logout,(){

                              }),
                              // menus('',LineIcons.line),
                              // menus('settings',LineIcons.line),

                            ],
                          ),
                        ),
                        ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget menus( String label, IconData icon,VoidCallback onTap){
    return   GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                SizedBox(width: 5,),
                Text( label,style:b),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded,color: grey,)
          ],
        ),
      ),
    );
  }
}
