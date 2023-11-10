import 'package:app_lo/addToList_screens/addToList_screen.dart';
import 'package:app_lo/trash_screen/trash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 185, 242, 225),
        child: ListView(
          children: [
            const ListTile(
              leading: Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text(
                'Cài đặt chung',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Colors.red,
            ),
            InkWell(
              onTap: () {
                Get.to(TrashScreens());
              },
              child: const ListTile(
                title: Text(
                  'Danh sách dữ liệu đã xoá',
                  style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(const AddToList());
              },
              child: const ListTile(
                title: Text(
                  'Thêm dữ liệu vào danh sách',
                  style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            )
          ],
        ));
  }
}
