import 'package:app_lo/home/Controller/getx_controller.dart';
import 'package:app_lo/home/detailed_screen/detailed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GestureDetectors extends StatefulWidget {
  final String name;
  final int id;
  final String body;
  final String email;
  const GestureDetectors(
      {super.key,
      required this.name,
      required this.id,
      required this.body,
      required this.email});

  @override
  State<GestureDetectors> createState() => _GestureDetectorsState();
}

class _GestureDetectorsState extends State<GestureDetectors> {
  final controller = Get.put(getxController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            widget.id.toString(),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Get.to(Detailed(
                name: widget.name,
                email: widget.email,
                body: widget.body,
              ));
            },
            child: Text(
              widget.name,
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
                name: widget.name,
                email: widget.email,
                body: widget.body,
              ));
            },
            child: Text(
              widget.email,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          trailing: GestureDetector(
              onTap: () {
                controller.deleteComment(widget.id);
              },
              child: const Icon(Icons.delete)),
        ),
        Divider(
          color: Colors.blueGrey[300],
        )
      ],
    );
  }
}
