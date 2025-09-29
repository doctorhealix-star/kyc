import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';
import '../../widgets/imageslider/imageslider.dart';
import '/core/constant/string.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';
import '../../widgets/imageslider/imageslider.dart';
import '/core/constant/string.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 5,
        title: Row(
          children: [
            // Profile Avatar with Border
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: grey, width: 1.5),
              ),
              child: ClipOval(
                child: SvgPicture.network(
                  "https://www.svgrepo.com/show/384670/account-avatar-profile-user.svg",
                  fit: BoxFit.contain, // 👈 makes image cover entire circle
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Greeting Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Good Morning',
                      style: b.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 18,
                      color: grey,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'Edmond',
                  style: s.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, notification);
              },
              icon: Icon(
                Icons.notifications_active_outlined,
                color: primary,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFF85CDCD),
                Colors.white,
            Colors.white,
            Colors.white,
          ]),
        ),

              // Banner Slider with Gradient Overlay
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.11,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BannerSlider(), // Reusable Banner Slider
                    ),

                    const SizedBox(height: 30),

                    // Optional: Add quick action buttons / categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildQuickAction(Icons.person_add_alt_1, 'Kyc', onTap: () {
                          Navigator.pushNamed(context, kyc);
                        }),

                        _buildQuickAction(Icons.person, 'Profile', onTap: () {
                          Navigator.pushNamed(context, profile);
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildQuickAction(Icons.policy, 'Terms & Policy', onTap: () {
                          Navigator.pushNamed(context, terms);
                        }),

                        _buildQuickAction(Icons.app_blocking, 'About App', onTap: () {
                          Navigator.pushNamed(context, about);
                        }),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Optional: Add featured cards or sections below banner

      ),
    );
  }

  // Quick Action Buttons
  Widget _buildQuickAction(IconData icon, String label,{required VoidCallback onTap}) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
           width: MediaQuery.of(context).size.width*0.45,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: primary,
                  size: 28,
                ),
                SizedBox(width: 10,),
                Text(
                  label,
                  style: s.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),

      ],
    );
  }
}
