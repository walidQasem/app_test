import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  final int id;
  final String name;
  final List<int> friends;
  final List<String> interests;
  final Color color;

  const UserComponent({
    super.key,
    required this.id,
    required this.name,
    required this.friends,
    required this.interests,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      child: Card(
        color: color,
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Name: $name',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Cairo",
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Interests: ${interests.join(", ")}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
