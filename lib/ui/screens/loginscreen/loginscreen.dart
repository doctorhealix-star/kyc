import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/core/constant/string.dart';
import '/core/constant/color.dart';

import '/core/constant/fonts.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final List<Map<String, String>> carouselItems = [
    {
      "image": "assets/images/onboard2.png",
      "text": "Trusted Doctors at Your Service",
    },
    {
      "image": "assets/images/onboard3.png",
      "text": "Book Appointments Easily",
    },
    {
      "image": "assets/images/onboardscreen1.png",
      "text": "24/7 Healthcare Support",
    },
  ];
  final CarouselSliderController _controller = CarouselSliderController();

  int _current = 0;
final TextEditingController mobileController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: ()async{

          // Show exit confirmation dialog
          bool shouldExit = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Are you sure you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false), // Don't exit
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true), // Exit
                  child: const Text('Exit'),
                ),
              ],
            ),
          );
          return shouldExit;
      },
      child: Scaffold(

        body: Column(
          children: [
            // 🔹 Top Carousel
            Container(
              color: primary,
              child: SizedBox(
                height: height * 0.7,
                width: width,

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: height  * 0.7,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: carouselItems.map((item) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height:
                               height * 0.05,),
                          Align(alignment:Alignment.topLeft,child: Text('Doctor Healix',style: h.copyWith(color: white,fontWeight: FontWeight.bold),)),
                          const SizedBox(height: 30),
                          Image.asset(
                            item["image"]!,
                            fit: BoxFit.contain,
                            width: width * 0.8,   // 👈 70% of screen width
                            height: height * 0.4,
                          ),
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              item["text"]!,
                              textAlign: TextAlign.start,
                              style: b.copyWith(color: white,fontWeight: FontWeight.bold)
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Dot Indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: carouselItems.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _controller.animateToPage(entry.key), // 👈 new API
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  width: _current == entry.key ? 50.0 : 25.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: _current == entry.key
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),



              ),
            ),
            SizedBox(height:20),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(mobilelogin);

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Column(
                  children: [
                    SizedBox(height: height*0.01),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Let’s get started! Enter your mobile number',
                        style: h.copyWith(fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: height*0.04),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color:greyshade.withOpacity(0.5),width: 1.0,
                      ),borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Country code
                            Row(
                              children:  [
                                Text("+91",style: b,),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 20, // Adjust height
                              width: 1,   // Thickness
                              color: Colors.grey, // Divider color
                            ),
                            const SizedBox(width: 10),
                            // Mobile number field
                            Expanded(
                              child: SizedBox(
                                height: height*0.055, // 👈 Fix height for TextField
                                child: TextField(
                                  controller: mobileController,
                                  keyboardType: TextInputType.phone,
                                  enabled: false,
                                  decoration: InputDecoration(

                                    isDense: true, // 👈 makes it more compact
                                    hintText: 'Enter your mobile number',
                                    hintStyle: b,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none
                                        // (color: grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                        // (color: grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                        // (color: grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            // 🔹 Bottom Section - Phone Login
            // Expanded(
            //   child: Container(
            //     width: width,
            //     padding: const EdgeInsets.all(20),
            //     decoration: const BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black12,
            //           blurRadius: 10,
            //           spreadRadius: 3,
            //         ),
            //       ],
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Text(
            //           "Login with Phone",
            //           style: TextStyle(
            //             fontSize: 22,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black87,
            //           ),
            //         ),
            //         const SizedBox(height: 20),
            //         TextField(
            //           keyboardType: TextInputType.phone,
            //           decoration: InputDecoration(
            //             prefixIcon: const Icon(Icons.phone_android),
            //             labelText: "Enter Phone Number",
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(height: 25),
            //         SizedBox(
            //           width: double.infinity,
            //           height: 50,
            //           child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.blueAccent,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(12),
            //               ),
            //             ),
            //             onPressed: () {
            //               // TODO: Implement OTP navigation
            //             },
            //             child: const Text(
            //               "Continue",
            //               style: TextStyle(fontSize: 18, color: Colors.white),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
