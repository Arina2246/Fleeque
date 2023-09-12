import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 79,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: transparent,
          shadowColor: transparent,
          elevation: 0,
        ),
        onPressed: () => {
          Navigator.pop(context),
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.chevron_left,
              color: white,
            ),
            Spacer(),
            BoldTextWidget(
                text: 'Back', color: white, textAlign: TextAlign.left),
          ],
        ),
      ),
    );
  }
}
