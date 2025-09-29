import 'package:flutter/material.dart';
import 'package:kyc/ui/widgets/buttons/buttons.dart';

import '/core/constant/string.dart';
import '/core/constant/fonts.dart';
import '/core/constant/color.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class OptScreen extends StatefulWidget {
  const OptScreen({super.key});

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Icon(Icons.question_mark,color: primary,),
              SizedBox(width: 5,),
              Text('Help',style: b.copyWith(color: primary),),
              SizedBox(width: 10,),
            ],
          )
        ],


      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter the Verification Code',
                            style: h.copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 10),
                        Center(
                          child: Image.asset(
                            otpimage,
                            fit: BoxFit.contain,
                            width: width * 0.6,
                            height: height * 0.3,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'We will send you one-time password to your mobile number',
                          style: b,
                        ),
                        const SizedBox(height: 20),
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: grey,
                          focusedBorderColor: primary,
                          // enabledBorderColor: primary,
                          disabledBorderColor:grey,
                          fieldHeight: 40,
                          fieldWidth: 40,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          showFieldAsBox: true,
                        margin: EdgeInsets.all(12),
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                          borderRadius: BorderRadius.circular(8),
                          borderWidth: 2.0,
                        ),

                      ],
                    ),

                  ),

                ),



              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PrimaryButton(
            text: "Verify",
            onPressed: () {
              Navigator.pushNamed(context, bottombar);
            },
          ),
        ),
      ),
    );
  }
}

