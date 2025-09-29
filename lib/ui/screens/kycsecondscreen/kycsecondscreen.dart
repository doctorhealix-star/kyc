import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyc/core/constant/color.dart';
import 'package:kyc/ui/widgets/textfields/labeltext.dart';
import 'package:line_icons/line_icon.dart';

import '../../../core/constant/fonts.dart';
import '../../../core/constant/string.dart';
import '../../../core/services/location/mapscreen.dart';
import '../../../data/dbStore/kycbloc/database_helper.dart';
import '../../widgets/genselection/genderselector.dart';
import '../../widgets/imageupload/uploadcoverbox.dart';
import '../../widgets/textfields/checkboxwithother.dart';
import '../../widgets/textfields/textfields.dart';


class kycSecondScreen extends StatefulWidget {
  const kycSecondScreen({super.key});

  @override
  State<kycSecondScreen> createState() => _kycSecondScreenState();
}

class _kycSecondScreenState extends State<kycSecondScreen> {
  final TextEditingController hospitalName = TextEditingController();
  final TextEditingController lat =TextEditingController();
  final TextEditingController long =TextEditingController();
  final TextEditingController appNameController = TextEditingController();

  bool isSameAsHospitalName = false;
  @override
  void dispose() {
    appNameController.dispose();
    lat.dispose();
    long.dispose();
    super.dispose();
  }


  bool isSameAsAppName = false;
  String? hospital = 'abi hospital';// checkbox state
@override
  void initState() {
   // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<String> appointmentSchedule = ['Morning', 'Afternoon', 'Evening', 'Other'];
    final List<String> operatedby = ['Doctor', 'Admin'];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        //automaticallyImplyLeading: false,
        title: Text('Good Morning', style: b.copyWith(color: Colors.white)),
        backgroundColor: primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LabelText(text: 'App Logo', star: '*'),
              SizedBox(height: 5),
              UploadCoverBox(),
              SizedBox(height: 10),
              LabelText(text: 'App Name', star: '*'),
              SizedBox(height: 5),
              AppTextfield(
                controller: hospitalName,
                hint: 'Enter the App Name',
                label: 'Enter the App Name',
                hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
                labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 15,
                        child: Checkbox(
                          value: isSameAsHospitalName,
                          onChanged: (bool? value) async {
                            setState(() {
                              isSameAsHospitalName = value ?? false;
                            });


                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('Same as Hospital Name', style: s),
                    ],
                ),
              ),
              SizedBox(height: 10),
              LabelText(text: 'App Color', star: '*'),
              SizedBox(height: 8),
              AppTextfield(
                controller: hospitalName,
                hint: 'Enter the App Color or Hex Code',
                label: 'Enter the App Color',
                hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
                labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(
                   width: MediaQuery.of(context).size.width*0.4,
                   child: Column(
                     children: [
                       LabelText(text: 'Latitude', star: '*'),
                       SizedBox(height: 8),
                       AppTextfield(
                         controller: lat,
                         hint: ' Latitude',
                         label: 'Latitude',
                         hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
                         labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(width: 10,),
                 SizedBox(
                   width: MediaQuery.of(context).size.width*0.4,
                   child: Column(
                     children: [
                       LabelText(text: 'Longitude', star: '*'),
                       SizedBox(height: 8),
                       AppTextfield(
                         controller: long,
                         hint: 'Longitude',
                         label: 'Longitude',
                         hintStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
                         labelStyle: s.copyWith(color: greyshade, fontWeight: FontWeight.bold),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(width: 5,),
                 SizedBox(
                   width: MediaQuery.of(context).size.width*0.1,
                   child: IconButton(
                     constraints: BoxConstraints(maxHeight: 10,maxWidth: 10),
                     icon: const Icon(Icons.gps_fixed_outlined),
                     onPressed: () async {
                       // ✅ Open map screen & wait for selected location
                       final result = await Navigator.push(
                         context,
                         CupertinoPageRoute(
                           builder: (context) => Mapscreen(),
                         ),
                       );

                       // ✅ Update fields if user selected a location
                       if (result != null) {
                         lat.text = result.latitude.toString();
                         long.text = result.longitude.toString();
                       }
                     },

                   ),
                 ),


               ],
             ),
              LabelText(text: 'OPD Appointment Schedule', star: '*'),
              CheckboxWithOther(options: appointmentSchedule),
              SizedBox(height: 10),
              LabelText(text: 'OPD Operated By', star: '*'),
              CheckboxWithOther(options: operatedby),
              LabelText(text: 'Gender', star: '*'),
              GenderSelector(),
            ],
          ),
        ),
      ),
    );
  }
}

