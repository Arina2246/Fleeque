import 'package:core_ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const SearchInputWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: white),
        borderRadius: BorderRadius.circular(30),
      ),
      width: double.maxFinite,
      height: 60,
      child: Center(
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              child: TextFormField(
                textAlign: TextAlign.center,
                style: const TextStyle(color: white),
                controller: controller,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                  labelStyle: GoogleFonts.roboto(
                    letterSpacing: .8,
                    color: white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: black),
                  ),
                  label: const Center(
                    child: Text('SEARCH...'),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
