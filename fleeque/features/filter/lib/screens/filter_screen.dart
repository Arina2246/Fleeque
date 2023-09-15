import 'package:app_bar/app_bar.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:filter/screens/widgets/dropdown_widget.dart';
import 'package:filter/screens/widgets/search_input.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  String priceSorting = 'Select';
  String timeSorting = 'Select';
  String followersFiltering = 'Select';
  String countryFiltering = 'Select';
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
    // widget.controller.add({
    //   'time': timeSorting,
    //   'price': priceSorting,
    //   'followers': followersFiltering,
    //   'country': countryFiltering,
    //   'search': _searchController.text
    // });
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
            FilterDropdownWidget(
              callback: updatePriceSorting,
              value: priceSorting,
              allValues: priceFilterItems,
            ),
            const Spacer(
              flex: 2,
            ),
            const RegularTextWidget(
                text: 'time', color: white, textAlign: TextAlign.left),
            const Divider(color: white),
            FilterDropdownWidget(
              callback: updateTimeSorting,
              value: timeSorting,
              allValues: timeFilterItems,
            ),
            const Spacer(
              flex: 2,
            ),
            const RegularTextWidget(
                text: 'popularity', color: white, textAlign: TextAlign.left),
            const Divider(color: white),
            FilterDropdownWidget(
              callback: (String? newValue) => {
                setState(() {
                  followersFiltering = newValue!;
                }),
              },
              value: followersFiltering,
              allValues: followersFilterItems,
            ),
            const Spacer(
              flex: 2,
            ),
            const RegularTextWidget(
                text: 'country', color: white, textAlign: TextAlign.left),
            const Divider(color: white),
            FilterDropdownWidget(
              callback: (String? newValue) => {
                setState(() {
                  countryFiltering = newValue!;
                }),
              },
              value: countryFiltering,
              allValues: countryFilterItems,
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
