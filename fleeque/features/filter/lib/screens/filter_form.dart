import 'package:app_bar/app_bar.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:filter/bloc/filter_bloc.dart';
import 'package:filter/screens/widgets/dropdown_widget.dart';
import 'package:filter/screens/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  State<FilterForm> createState() => _FilterForm();
}

class _FilterForm extends State<FilterForm> {
  final TextEditingController _searchController = TextEditingController();

  sendFilterData() {
    BlocProvider.of<FilterBloc>(context).add(
      UpdateFiltres(_searchController.text),
    );
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
        isSettingsShown: false,
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return Padding(
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
                  callback: (String? newValue) =>
                      BlocProvider.of<FilterBloc>(context).add(
                    UpdatePrice(newValue!),
                  ),
                  value: state.priceSorting,
                  allValues: priceFilterItems,
                ),
                const Spacer(
                  flex: 2,
                ),
                const RegularTextWidget(
                    text: 'time', color: white, textAlign: TextAlign.left),
                const Divider(color: white),
                FilterDropdownWidget(
                  callback: (String? newValue) =>
                      BlocProvider.of<FilterBloc>(context).add(
                    UpdateTime(newValue!),
                  ),
                  value: state.timeSorting,
                  allValues: timeFilterItems,
                ),
                const Spacer(
                  flex: 2,
                ),
                const RegularTextWidget(
                    text: 'popularity',
                    color: white,
                    textAlign: TextAlign.left),
                const Divider(color: white),
                FilterDropdownWidget(
                  callback: (String? newValue) =>
                      BlocProvider.of<FilterBloc>(context).add(
                    UpdateFollowers(newValue!),
                  ),
                  value: state.followersFiltering,
                  allValues: followersFilterItems,
                ),
                const Spacer(
                  flex: 2,
                ),
                const RegularTextWidget(
                    text: 'country', color: white, textAlign: TextAlign.left),
                const Divider(color: white),
                FilterDropdownWidget(
                  callback: (String? newValue) =>
                      BlocProvider.of<FilterBloc>(context).add(
                    UpdateCountries(newValue!),
                  ),
                  value: state.countryFiltering,
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
          );
        },
      ),
    );
  }
}
