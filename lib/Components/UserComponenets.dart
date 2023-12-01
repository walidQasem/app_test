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
      duration: const Duration(milliseconds: 1000),
      child: Card(
        color: color,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Name: $name',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 79, 79, 79),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Friends: ${friends.join(", ")}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 79, 79, 79),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Interests: ${interests.join(", ")}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 79, 79, 79),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
