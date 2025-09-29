import 'dart:convert';

import 'package:csc_picker_plus/csc_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_country_state/flutter_country_state.dart';
import 'package:flutter_country_state/state_screen.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';
import '../../../core/services/countryandstate/csc.dart';
import '../../../data/dbStore/kycbloc/kyc_bloc.dart';
import '../../../data/dbStore/kycbloc/kyc_event.dart';
import '../../../model/kyc_model.dart';
import '../../widgets/dropdown/dropdown.dart';
import '../../widgets/textfields/droupdown.dart';
import '../../widgets/textfields/labeltext.dart';
import '../../widgets/textfields/notes.dart';
import '../../widgets/textfields/textfields.dart';
import 'package:country_picker/country_picker.dart';

import '../kycVerification/kycverfixcation.dart';
class Kycscreen extends StatefulWidget {
  const Kycscreen({super.key});

  @override
  State<Kycscreen> createState() => KycscreenState();
}

class KycscreenState extends State<Kycscreen> {
  ///
  final TextEditingController hospitalName = TextEditingController();
  final TextEditingController doctorName = TextEditingController();
  final TextEditingController specialization = TextEditingController();
  final TextEditingController hospitalAddress = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController notes = TextEditingController();
  String? countryValue;
  String? stateValue;
  String? cityValue;

  void displayMsg(msg) {
    print(msg);
  }

  // KYC status
String selectedCountry ='';
  String selectedState ='';
  String selectedCity ='';
 List<String?> hospitaltype = [
  'Single Doctor',
  'Single Doctor, Single Admin',
  'Multi Doctors, Single Admin',
  'Multi Doctors, Multi Admins',
  'Multi Doctors, Multi Admins, Multi Departments',
];
  String? Selectedhospital ;

  KycModel getkycData(){
   return KycModel(hospitalName: hospitalName.text, doctorName: doctorName.text, specialization: specialization.text, hospitalType: Selectedhospital ?? '', country: selectedCountry, state: selectedState, city: selectedCity
       , hospitalAddress: hospitalAddress.text, contact: contactNumber.text, email: email.text, notes: notes.text);
 }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          LabelText(text: 'Hospital Name', star: '*'),
          const SizedBox(height: 5),
          AppTextfield(
            controller: hospitalName,
            hint: 'Enter the Hospital Name',
            label: 'Hospital Name',
            hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
            labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          LabelText(text: 'Doctor Name', star: '*'),
          const SizedBox(height: 5),
          AppTextfield(
            controller: doctorName,
            hint: 'Enter the Doctor Name',
            label: 'Doctor Name',
            hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
            labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          LabelText(text: 'Specialization', star: '*'),
          const SizedBox(height: 5),
          AppAutoCompleteTextField(
            label: 'Specialization',
            hint: 'Specialization In',
            controller: specialization,
            suggestions: [
              'Cardiologist',
              'Dermatologist',
              'Neurologist',
              'Orthopedic',
              'Pediatrician',
              'Psychiatrist',
              'General Surgeon',
            ],
            onChanged: (val) {
              print("Selected: $val");
            },
            labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
            hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),
          LabelText(text: 'Hospital Type', star: '*'),
          const SizedBox(height: 5),
          SizedBox(
            height: height*0.055,
            width: double.infinity,
            child: Dropdown(HospitalType : hospitaltype , label: Selectedhospital, onChanged: (String? value) {setState(() {
              Selectedhospital= value;
            });  }, hint: 'Hospital Type',),
          ),
          const SizedBox(height: 10),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const LabelText(text: "Country", star: "*"),
          //     CSCPickerPlus(
          //       showStates: false,
          //       showCities: false, // only country
          //       onCountryChanged: (country) {
          //         setState(() {
          //           selectedCountry = country;
          //         });
          //       },
          //     ),
          //     const SizedBox(height: 10),
          //     const LabelText(text: "State", star: "*"),
          //     CSCPickerPlus(
          //       showStates: true,
          //       showCities: false,
          //
          //       currentCountry:selectedCountry ,// only state
          //
          //       onStateChanged: (state) {
          //         setState(() {
          //           selectedState = state!;
          //         });
          //       },
          //     ),
          //     const SizedBox(height: 10),
          //     const LabelText(text: "City", star: "*"),
          //     CSCPickerPlus(
          //       showStates: false,
          //       showCities: true,
          //       // only city
          //       // selectedCountry: selectedCountry,
          //       // selectedState: selectedState,
          //       onCityChanged: (city) {
          //         setState(() {
          //           selectedCity = city!;
          //         });
          //       },
          //     ),
          //   ],
          // ),


Column(children: [

  CustomCSCPickerDialog(onCountryChanged: (c) => print("Country: $c"),
    onStateChanged: (s) => print("State: $s"),
    onCityChanged: (ci) => print("City: $ci"),),

],),



          const SizedBox(height: 10),
          LabelText(text: 'Hospital Address', star: '*'),
          const SizedBox(height: 5),
          AppTextfield(
            controller: hospitalAddress,
            hint: 'Enter the Hospital Address',
            label: 'Hospital Address',
            hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
            labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          LabelText(text: 'Contact', star: '*'),
          const SizedBox(height: 5),
          AppTextfield(
            controller: contactNumber,
            hint: 'Enter the Contact Number',
            label: 'Contact',
            hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
            labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          LabelText(text: 'Email', star: '*'),
          const SizedBox(height: 5),
          AppTextfield(
            controller: email,
            hint: 'Enter the email',
            label: 'email',
            hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
            labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          LabelText(text: 'Notes', star: '*'),
          const SizedBox(height: 5),
          NotesTextField(controller: notes,),
          const SizedBox(height: 30),
          // ElevatedButton(
          //   onPressed: () {
          //     final kyc = KycModel(
          //       hospitalName: hospitalName.text,
          //       doctorName: doctorName.text,
          //       specialization: specialization.text,
          //       hospitalType: Selectedhospital ?? '',
          //       country: selectedCountry,
          //       state: selectedState,
          //       city: selectedCity,
          //       hospitalAddress: hospitalAddress.text,
          //       contact: contactNumber.text,
          //       email: email.text,
          //       notes: notes.text,
          //     );
          //     print(' saving  the hospital  data kyc${kyc}');
          //     // Dispatch Add Event
          //     context.read<KycBloc>().add(AddKyc(kyc));
          //
          //     // // ✅ Clear fields
          //     // hospitalName.clear();
          //     // doctorName.clear();
          //     // specialization.clear();
          //     // hospitalAddress.clear();
          //     // contactNumber.clear();
          //     // email.clear();
          //     // notes.clear();
          //     // setState(() {
          //     //   Selectedhospital = null;
          //     //   selectedCountry = '';
          //     //   selectedState = '';
          //     //   selectedCity = '';
          //     // });
          //
          //     // ✅ Show confirmation
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text("KYC saved successfully!")),
          //     );
          //
          //     // ✅ Navigate to Verification Screen
          //     // Navigator.pushReplacement(
          //     //   context,
          //     //   MaterialPageRoute(builder: (_) => const KycVerification()),
          //     // );
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blue,
          //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          //   ),
          //   child: const Text("Save KYC", style: TextStyle(fontSize: 16, color: Colors.white)),
          // )


        ],
      ),
    );
  }
}
