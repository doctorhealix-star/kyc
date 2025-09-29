import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

import '../../../ui/widgets/textfields/labeltext.dart';
import '../../constant/color.dart';
import '../../constant/fonts.dart';

class CustomCSCPickerDialog extends StatefulWidget {
  final void Function(String) onCountryChanged;
  final void Function(String) onStateChanged;
  final void Function(String) onCityChanged;
  final double spacing;

  const CustomCSCPickerDialog({
    super.key,
    required this.onCountryChanged,
    required this.onStateChanged,
    required this.onCityChanged,
    this.spacing = 10.0,
  });

  @override
  _CustomCSCPickerDialogState createState() => _CustomCSCPickerDialogState();
}

class _CustomCSCPickerDialogState extends State<CustomCSCPickerDialog> {
  List<dynamic> _data = [];
  String _selectedCountry = "Choose Country";
  String _selectedState = "Choose State";
  String _selectedCity = "Choose City";

  List<String> _countries = ["Choose Country"];
  List<String> _states = ["Choose State"];
  List<String> _cities = ["Choose City"];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String res = await rootBundle.loadString('assets/country.json');
    _data = jsonDecode(res);

    setState(() {
      _countries.addAll(_data.map((e) => e['name'].toString()));

      // ✅ Default to India
      if (_countries.contains("India")) {
        _selectedCountry = "India";

        final india = _data.firstWhere((e) => e['name'] == "India");
        final states = india['states'] as List<dynamic>;
        _states.addAll(states.map((e) => e['name'].toString()));
      }
    });
  }

  Future<void> _showSelectionDialog({
    required String title,
    required List<String> items,
    required Function(String) onSelected,
  }) async {
    TextEditingController searchController = TextEditingController();
    List<String> filteredItems = List.from(items);

    final selected = await showDialog<String>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            backgroundColor: white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: s.copyWith(fontSize: 17),),
                Icon(LineIcons.times,size: 24,color: red,)
              ],
            ),
            content: SizedBox(
              width: double.maxFinite,
              height: 400, // ✅ fix: give dialog a height limit
              child: Column(
                children: [
                  // 🔎 Search Field
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search...",
                      hintStyle: s.copyWith(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: greyshade.withOpacity(0.5),width: 1.0)
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: primary,width: 2.0)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: red,width: 1.0)
                      ),
                    ),
                    onChanged: (value) {
                      setStateDialog(() {
                        filteredItems = items
                            .where((e) =>
                            e.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(height: 10),

                  // 📋 Filtered List
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredItems
                          .where((e) => e != "Choose City" && e != "Choose State")
                          .length,
                      itemBuilder: (context, index) {
                        final visibleItems = filteredItems
                            .where((e) => e != "Choose City" && e != "Choose State")
                            .toList();

                        if (title == "Select Country") {
                          // ✅ Country list with flag
                          final country = _data.firstWhere(
                                (e) => e['name'] == visibleItems[index],
                            orElse: () => {"iso2": ""},
                          );
                          final iso = country['iso2'] ?? "";
                          final flag = countryCodeToEmoji(iso);

                          return ListTile(
                            leading: Text(flag, style: const TextStyle(fontSize: 20)),
                            title: Text(visibleItems[index]),
                            onTap: () {
                              Navigator.pop(context, visibleItems[index]);
                            },
                          );
                        } else {
                          // ✅ State/City list without "Choose ..." placeholder
                          return ListTile(
                            title: Text(visibleItems[index]),
                            onTap: () {
                              Navigator.pop(context, visibleItems[index]);
                            },
                          );
                        }
                      },
                    ),
                  ),



                ],
              ),
            ),
          );
        },
      ),
    );

    if (selected != null) onSelected(selected);
  }

  void _onCountryTap() {
    _showSelectionDialog(
      title: "Select Country",
      items: _countries,
      onSelected: (value) {
        setState(() {
          _selectedCountry = value;
          _selectedState = "Choose State";
          _selectedCity = "Choose City";
          _states = ["Choose State"];
          _cities = ["Choose City"];

          // Load states for selected country
          final country = _data.firstWhere((e) => e['name'] == value);
          final states = country['states'] as List<dynamic>; // ✅ FIXED KEY
          _states.addAll(states.map((e) => e['name'].toString()));
        });
        widget.onCountryChanged(value);
      },
    );
  }

  void _onStateTap() {
    _showSelectionDialog(
      title: "Select State",
      items: _states,
      onSelected: (value) {
        setState(() {
          _selectedState = value;
          _selectedCity = "Choose City";
          _cities = ["Choose City"];

          // Load cities for selected state
          final country = _data.firstWhere((e) => e['name'] == _selectedCountry);
          final states = country['states'] as List<dynamic>; // ✅ correct
          final state = states.firstWhere((e) => e['name'] == value);
          final cities = state['cities'] as List<dynamic>; // ✅ correct
          _cities.addAll(cities.map((e) => e['name'].toString()));
        });
        widget.onStateChanged(value);
      },
    );
  }
  String countryCodeToEmoji(String code) {
    if (code.isEmpty) return "🏳️";
    return code.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
  }

  void _onCityTap() {
    _showSelectionDialog(
      title: "Select City",
      items: _cities,
      onSelected: (value) {
        setState(() {
          _selectedCity = value;
        });
        widget.onCityChanged(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Country
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  LabelText(text: 'Country', star: '*'),
                  SizedBox(height: 5,),
                  GestureDetector(
                    onTap: _onCountryTap,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyshade.withOpacity(0.5),width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
    children: [
    if (_selectedCountry != "Choose Country") ...[
    Text(
    countryCodeToEmoji(
    _data.firstWhere(
    (e) => e['name'] == _selectedCountry,
    orElse: () => {"iso2": ""},
    )['iso2'] as String? ?? "",
    ),
    ),
      SizedBox(width: 6,)
    ],
    Flexible(child: Text(_selectedCountry, style: s.copyWith())),
    ],
    ),

    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),

            // State
                   Expanded(
                     child: Column(
                       children: [
                         LabelText(text: 'State', star: '*'),
                         SizedBox(height: 5,),
                         GestureDetector(
                                         onTap: _onStateTap,
                                         child: Container(
                                           width: MediaQuery.of(context).size.width*0.5,
                                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                           decoration: BoxDecoration(
                          border: Border.all(color: greyshade.withOpacity(0.5),width: 1.0),
                          borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Text(_selectedState,style: s.copyWith(),),
                                         ),
                                       ),
                       ],
                     ),
                   ),
          ],
        ),

        SizedBox(height: 10),

        // City
        Column(
          children: [
            LabelText(text: 'City', star: '*'),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: _onCityTap,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: greyshade.withOpacity(0.5),width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_selectedCity,style: s.copyWith(),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
