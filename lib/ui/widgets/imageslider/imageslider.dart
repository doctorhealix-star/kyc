import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kyc/core/constant/color.dart';

import '../../../core/constant/string.dart';



class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  final List<Map<String, String>> bannerItems = [
    {
      "image": "${banner1}",
      "text": "Welcome to Our App",
    },
    {
      "image": "${banner1}",
      "text": "Explore Amazing Features",
    },
    {
      "image": "${banner1}",
      "text": "Get Started Now",
    },
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1.5,
            height: height * 0.25, // banner height
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: bannerItems.map((item) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item["image"]!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 8),

        // Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerItems.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _current == entry.key ? 16.0 : 8.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: _current == entry.key
                      ? primary
                      : Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
