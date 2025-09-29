import 'package:flutter/material.dart';
import 'package:kyc/core/constant/color.dart';
import 'package:kyc/core/constant/string.dart';
import 'package:kyc/ui/widgets/buttons/buttons.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constant/fonts.dart';

class KycVerification extends StatefulWidget {
  const KycVerification({super.key});

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ✅ Lottie Animation
          const SizedBox(height: 10),
          Lottie.asset(
            verfication, // replace with your asset path
            height: 250,
            width: 250,
          ),

          // const SizedBox(height: 10),

          // ✅ Title
          Text(
            "Verification is in Progress",
            style: b.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal:16 ),
            child: Text(
              textAlign: TextAlign.center,
              'Your documents are under review. This process may take up to 24 hours',
              style: s.copyWith(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal:16 ),
            child: Text(
              textAlign: TextAlign.center,
              'For Immediate Response',
              style: s.copyWith( color: primary,fontWeight: FontWeight.bold),
            ),
          ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: PrimaryButton(text: ' Contact us', onPressed: () async{
    _makePhoneCall('+919344125022');
  },),
)
          // ✅ Contact Section
        ],
      ),
    );
  }
}
