import 'package:app_lo/home/Controller/getx_controller.dart';
import 'package:app_lo/widget/buttom_bar.dart';
import 'package:app_lo/widget/drawer.dart';
import 'package:app_lo/widget/gestureDetector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final controller = Get.put(getxController());
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawers(),
        appBar: AppBar(
          title: const Text(
            "app_bar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Button(),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 60,
                margin: const EdgeInsets.all(12),
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    controller.search(value);
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 6, 7, 6), width: 2)),
                      hintText: 'screach_home',
                      prefixIcon: const Icon(Icons.search),
                      suffix: IconButton(
                        onPressed: () {
                          _textEditingController.clear();
                          controller.search('');
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx(() {
                  if (controller.searchText.isEmpty) {
                    print("Đang xây dựng lại Obx - : ${controller.searchText}");

                    return ListView.builder(
                      itemCount: controller.listStudent.length,
                      itemBuilder: (context, index) {
                        final item = controller.listStudent[index];
                        return GestureDetectors(
                          name: item.name ?? '',
                          id: item.id!,
                          email: item.email ?? '',
                          body: item.body ?? '',
                        );
                      },
                    );
                  } else {
                    print(
                        "Đang xây dựng lại Obx - searchText: ${controller.searchText}");
                    return ListView.builder(
                      itemCount: controller.timkiem.length,
                      itemBuilder: (context, index) {
                        final item = controller.timkiem[index];
                        return GestureDetectors(
                          name: item.name ?? '',
                          id: item.id,
                          email: item.email ?? '',
                          body: item.body ?? '',
                        );
                      },
                    );
                  }
                }),
              )
            ],
          ),
        ));
  }
}
