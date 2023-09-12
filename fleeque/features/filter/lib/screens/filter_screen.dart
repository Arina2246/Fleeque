import 'dart:async';

import 'package:app_bar/app_bar.dart';
import 'package:core_ui/core_ui.dart';
import 'package:filter/screens/widgets/input.dart';
import 'package:filter/screens/widgets/price_dropdown.dart';
import 'package:filter/screens/widgets/search_input.dart';
import 'package:filter/screens/widgets/time_dropdown.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final StreamController<Map<String, dynamic>> controller;
  const FilterScreen({Key? key, required this.controller}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  String priceSorting = 'Select';
  String timeSorting = 'Select';
  final TextEditingController _popularityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  updatePriceSorting(String? newValue) {
    setState(() {
      priceSorting = newValue!;
    });
    if (priceSorting != 'Select') {
      setState(() {
        timeSorting = 'Select';
      });
    }
  }

  updateTimeSorting(String? newValue) {
    setState(() {
      timeSorting = newValue!;
    });
    if (timeSorting != 'Select') {
      setState(() {
        priceSorting = 'Select';
      });
    }
  }

  sendFilterData() {
    widget.controller.add({
      'time': timeSorting,
      'price': priceSorting,
      'search': _searchController.text
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: const AppBarWidget(
        backgroundColor: black,
        isOnline: false,
        isDiscontShown: false,
        isWalletShown: false,
        isUserShown: false,
        isLogoShown: false,
        isInfoShown: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExtraBoldTextWidget(
                text: 'Sort by', color: white, textAlign: TextAlign.left),
            const Spacer(
              flex: 2,
            ),
            const RegularTextWidget(
                text: 'price', color: white, textAlign: TextAlign.left),
            const Divider(color: white),
            PriceDropdownWidget(
              callback: updatePriceSorting,
              value: priceSorting,
            ),
            const Spacer(
              flex: 2,
            ),
            const RegularTextWidget(
                text: 'time', color: white, textAlign: TextAlign.left),
            const Divider(color: white),
            TimeDropdownWidget(
              callback: updateTimeSorting,
              value: timeSorting,
            ),
            const Spacer(
              flex: 2,
            ),
            const RegularTextWidget(
                text: 'popularity', color: white, textAlign: TextAlign.left),
            const Divider(color: white),
            TextInputWidget(
              labelText: '> 1m followers',
              controller: _popularityController,
            ),
            const Spacer(
              flex: 2,
            ),
            const RegularTextWidget(
                text: 'country', color: white, textAlign: TextAlign.left),
            const Divider(color: white),
            TextInputWidget(
              labelText: 'France',
              controller: _countryController,
            ),
            const Spacer(
              flex: 4,
            ),
            const BoldTextWidget(
                text:
                    'Mickey Notter / Rima Justiniano / Na Matthew / Walton Yonts '
                    ' / Jared Bartee / Carol Vincent...',
                color: white,
                textAlign: TextAlign.justify),
            const Spacer(),
            SearchInputWidget(
              controller: _searchController,
            ),
            const Spacer(),
            ElevatedButtonWidget(
              width: double.maxFinite.toInt(),
              borderColor: white,
              backgroundColor: white,
              textColor: black,
              text: 'FILTER',
              onPressed: () {
                sendFilterData();
              },
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
