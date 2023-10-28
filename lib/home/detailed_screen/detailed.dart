import 'package:flutter/material.dart';

class Detailed extends StatelessWidget {
  const Detailed(
      {super.key, required this.name, required this.email, required this.body});
  final String name;
  final String email;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                email,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                body,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
