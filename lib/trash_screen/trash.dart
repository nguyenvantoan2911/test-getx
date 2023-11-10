import 'package:app_lo/home/detailed_screen/detailed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/Controller/getx_controller.dart';

class TrashScreens extends StatelessWidget {
  TrashScreens({super.key});
  final controller = Get.put(getxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách đã xoá'),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: controller.deletionList.length,
            itemBuilder: (context, index) {
              final items = controller.deletionList[index];
              return Column(
                children: [
                  ListTile(
                    leading: Text(
                      items.id.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Get.to(Detailed(
                          name: items.name,
                          email: items.email,
                          body: items.body,
                        ));
                      },
                      child: Text(
                        items.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    subtitle: GestureDetector(
                      onTap: () {
                        Get.to(Detailed(
                          name: items.name,
                          email: items.email,
                          body: items.body,
                        ));
                      },
                      child: Text(
                        items.email,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    trailing: GestureDetector(
                        onTap: () {
                          controller.restoreComment(items.id);
                        },
                        child: const Icon(Icons.person_add)),
                  ),
                  Divider(
                    color: Colors.blueGrey[300],
                  )
                ],
              );
            });
      }),
    );
  }
}
