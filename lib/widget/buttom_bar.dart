import 'package:app_lo/widget/translations.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        child: const Center(
            child: Icon(
          Icons.g_translate,
          size: 25,
        )),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const translations(),
            direction: PopoverDirection.bottom,
            backgroundColor: Colors.white,
            width: 200,
            height: 150,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}
