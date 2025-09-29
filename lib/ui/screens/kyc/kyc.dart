import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc/core/constant/color.dart';
import 'package:kyc/ui/screens/kycsecondscreen/kycsecondscreen.dart';
import 'package:kyc/ui/widgets/buttons/buttons.dart';
import 'package:kyc/ui/widgets/textfields/textfields.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constant/string.dart';
import '../../../data/dbStore/kycbloc/kyc_bloc.dart';
import '../../../data/dbStore/kycbloc/kyc_event.dart';
import '../kycVerification/kycverfixcation.dart';
import '../kycscreen1/kycscreen.dart';
import '/core/constant/fonts.dart';
import '../../widgets/textfields/droupdown.dart';
import '../../widgets/textfields/labeltext.dart';
import '/ui/screens/kycscreen1/kycscreen.dart';
class KYC extends StatefulWidget {
  const KYC({super.key});

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Text editing controllers
  final TextEditingController hospitalName = TextEditingController();
  final TextEditingController doctorName = TextEditingController();
  final TextEditingController specialization = TextEditingController();
  final TextEditingController hospitalAddress = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();

  // KYC status
  bool _isStep2Verified = false;
  bool _isStep3Verified = false;

  @override
  void initState() {
    super.initState();
    // Initialize with sample data (you can replace with actual data)
  }
  final GlobalKey<KycscreenState> kyckey = GlobalKey<KycscreenState>();
  void _nextPage() {
    if (_currentPage == 0) {
      // Validate first
      // if (!(kyckey.currentState?.validateForm(context) ?? false)) {
      //   return; // ❌ stop if not valid
      // }

      // ✅ Get KYC Data
      final kyc = kyckey.currentState?.getkycData();
      print("Saving KYC from Next button: ${kyc}");
      if (kyc != null) {
        print("Saving KYC from Next button: ${kyc.toMap()}");

        // Save via Bloc
        context.read<KycBloc>().add(AddKyc(kyc));

        // Confirmation
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("KYC saved successfully!")),
        );

        // ✅ Navigate ONLY if success
        // _pageController.nextPage(
        //   duration: const Duration(milliseconds: 300),
        //   curve: Curves.easeInOut,
        // );
      }
    } else {
      // For later steps
      // Navigator.pushReplacementNamed(context, kyc2);
    }
  }

  void _verifyStep2() {
    setState(() {
      _isStep2Verified = true;
    });

    // After verification, navigate to home
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(
        context,
        kyc2);// <-- your home screen widget

    });
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateProfile() {
    // Here you would typically save the data to your backend/database
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  // void _verifyStep2() {
  //   // Simulate verification process
  //   setState(() {
  //     _isStep2Verified = true;
  //   });
  //
  //   // After verification, move to next page
  //   Future.delayed(const Duration(seconds: 1), () {
  //     _nextPage();
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleSpacing: 8,
        automaticallyImplyLeading: false,
        title: Text('KYC Verification', style: h.copyWith(color: white, fontWeight: FontWeight.bold,fontSize: 20)),
        centerTitle: false,
        elevation: 0,
        backgroundColor: primary,
        toolbarHeight: 50,
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.circular(20),
        //     ),
        //   ),
        // ),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          // Step indicator
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              color: primary,
            ),

            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStepIndicator(0, "Basic Info", _currentPage >= 0),
                    _buildStepDivider(_currentPage >= 0),
                    _buildStepIndicator(1, "Verification", _currentPage >= 1),
                    // _buildStepDivider(_currentPage >= 1),
                    // _buildStepIndicator(2, "2th KYC", _currentPage >= 2),
                    //
                    // _buildStepDivider(_currentPage >= 2),
                    // _buildStepIndicator(3, "Completion", _currentPage >= 3),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // Step 1: Basic Information
                Kycscreen(key: kyckey),

                // Step 2: Verification (Waiting)
                KycVerification(),

                // Kycscreen(),
                // // Step 3: KYC Completion
                // _buildStep3(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildStepIndicator(int stepNumber, String title, bool isActive) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isActive ? white : grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${stepNumber + 1}',
              style:  b.copyWith(color:  isActive ? primary : white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: s.copyWith(
            color: isActive ? white : grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildStepDivider(bool isActive) {
    return Container(
      width: 40,
      height: 1,
      color: isActive ? white : grey,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }




  Widget _buildBottomNavigation() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _currentPage == 0
            ? SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: 'Next',
            onPressed: _nextPage,
          ),
        )
            : Row(
          children: [
            // Previous button
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: primary, width: 2),
                ),
                onPressed: _previousPage,
                child: FittedBox(child: Text('Previous', style: b)),
              ),
            ),

            const SizedBox(width: 10),

            // Next / Complete button
            Expanded(
              child: PrimaryButton(
                text: _currentPage == 4 ? 'Complete' : 'Next',
                onPressed: _currentPage == 3 ? null : _nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    hospitalName.dispose();
    doctorName.dispose();
    specialization.dispose();
    hospitalAddress.dispose();
    contactNumber.dispose();
    email.dispose();
    super.dispose();
  }
}
