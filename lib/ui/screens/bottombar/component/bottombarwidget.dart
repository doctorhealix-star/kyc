import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kyc/core/constant/color.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/constant/fonts.dart';
    class AppBottombar extends StatelessWidget {
      final int currentindex;
      final ValueChanged<int> onTap;
      const AppBottombar({super.key,required this.currentindex,required this.onTap});

      final List<Map<String, dynamic>> items = const [
        {"icon": LineIcons.home, "label": "Home"},
        {"icon": LineIcons.facebookMessenger, "label": "Chat"},
        {"icon": LineIcons.user, "label": "About"},
      ];
      @override
      Widget build(BuildContext context) {
        return  Container(

          decoration: BoxDecoration(
            color: Colors.white,
        // border: Border.(c)
        border:Border(top: BorderSide(color: greyshade.withOpacity(0.4)))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isActive = currentindex == index;
                return Expanded(
                  child: InkWell(
                    onTap: () => onTap(index),
                    borderRadius: BorderRadius.circular(20),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: isActive ? primary.withOpacity(0.1) : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            item["icon"],
                            color: isActive ? primary: Colors.grey,
                            size: 26,
                          ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1),
                          if (isActive) ...[
                            const SizedBox(width: 6),
                            Text(
                              item["label"],
                              style: s.copyWith(color: isActive ? primary: Colors.grey,fontWeight: FontWeight.bold),
                            ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1),
                          ]

                        ],
                      )
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      }
    }
