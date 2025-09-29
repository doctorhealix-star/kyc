import 'package:country_picker/country_picker.dart';
import 'package:csc_picker_plus/model/select_status_model.dart' hide Country;
import 'package:flutter/material.dart';
import 'package:kyc/core/constant/color.dart';
import 'package:kyc/ui/widgets/buttons/buttons.dart';

import '/core/constant/string.dart';
import '/core/constant/fonts.dart';
import 'package:flutter/services.dart';
class Mobileloginscreen extends StatefulWidget {
  const Mobileloginscreen({super.key});

  @override
  State<Mobileloginscreen> createState() => _MobileloginscreenState();
}

class _MobileloginscreenState extends State<Mobileloginscreen> {
final  TextEditingController mobileController =TextEditingController();
Country _selectedCountry = Country(
  phoneCode: "91",
  countryCode: "IN",
  e164Sc: 0,
  geographic: true,
  level: 1,
  name: "India",
  example: "India",
  displayName: "India",
  displayNameNoCountryCode: "India",
  e164Key: "",
);
bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Align(
                  alignment:Alignment.topLeft,child: Text('Enter your mobile number',style: h.copyWith(fontWeight: FontWeight.bold,fontSize: 18),)),
        
              SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isTapped ? Colors.blue : Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Country picker
                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          countryListTheme: CountryListThemeData(
                            borderRadius: BorderRadius.circular(15),
                            bottomSheetHeight: MediaQuery.of(context).size.height * 0.6,
                            inputDecoration:
                            InputDecoration(
                              isDense: true,
                              labelText:  'Search Country',
                              labelStyle: s.copyWith(),
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search Country',
                              hintStyle: s.copyWith(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: greyshade.withOpacity(0.5),width: 1.0)
                              ),
                              focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: primary,width: 2.0)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: red,width: 1.0)
                              ),
                            ),
                          ),
                          onSelect: (Country country) {
                            setState(() {
                              _selectedCountry = country;
                            });
                          },
                        );
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              _selectedCountry.flagEmoji,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: 4),
                            Text("+${_selectedCountry.phoneCode}"),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Divider
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 8),

                    // Mobile number field
                    Expanded(
                      child: SizedBox(
                        height: height * 0.055,
                        child: Center(
                          child: TextField(
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Enter your mobile number',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
              SizedBox(height: 20,),
              Column(
                children: [
                  Align(
                      alignment:Alignment.topLeft,child: Text('By continuing. You agree to our ',style: b.copyWith()),
        
                  ),
                  Align(
                    alignment:Alignment.topLeft,child: Text('Terms & Conditions ',style: b.copyWith()),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child:PrimaryButton(text: 'Continue', onPressed: (){

                  Navigator.pushNamed(context, otp );
                }),
              )
            ]
        
        
          ),
        ),
      ),
    );
  }
}
