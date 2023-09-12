import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core/core.dart';

class PriceDropdownWidget extends StatelessWidget {
  Function(String?) callback;
  String value;

  PriceDropdownWidget({Key? key, required this.callback, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: DropdownButton(
        iconSize: 0.0,
        underline: const SizedBox(),
        dropdownColor: black,
        style: GoogleFonts.roboto(
          letterSpacing: 0,
          color: white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationColor: white,
        ),
        value: value,
        items: priceFilterItems.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          callback(newValue);
        },
      ),
    );
  }
}
