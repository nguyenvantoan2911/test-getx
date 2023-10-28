import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class translations extends StatelessWidget {
  const translations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buttonIcon(
              onPressed: () {
                Get.back();
                context.setLocale(const Locale("vi", "VN"));
              },
              image: 'asset/images/vietnam-removebg-preview.png',
              name: "Tiếng việt"),
          const Divider(),
          _buttonIcon(
              onPressed: () {
                Get.back();
                context.setLocale(const Locale('en', 'US'));
              },
              image: 'asset/images/anh-removebg-preview.png',
              name: 'English'),
        ],
      ),
    );
  }

  Widget _buttonIcon(
      {required VoidCallback onPressed,
      required String image,
      required String name}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 4),
        height: 50,
        color: const Color.fromARGB(255, 14, 212, 209),
        child: Center(
            child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image))),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ).tr()
          ],
        )),
      ),
    );
  }
}
