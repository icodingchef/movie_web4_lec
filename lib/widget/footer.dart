import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text("ⓒ2024 Movie WebApp all rights reserved"),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 16,
            children: [
              TextButton(onPressed: () {}, child: const Text("Abou us")),
              TextButton(onPressed: () {}, child: const Text("Privacy Policy")),
              TextButton(
                  onPressed: () {}, child: const Text("Terms of Sevice")),
            ],
          )
        ],
      ),
    );
  }
}
