import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  final int id;
  final String name;
  final List<int> friends;
  final List<String> interests;
  final Color color;

  UserComponent({
    required this.id,
    required this.name,
    required this.friends,
    required this.interests,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: $id',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Friends: ${friends.join(", ")}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Interests: ${interests.join(", ")}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void fetchUsers() async {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('your_users_collection').get();

//     setState(() {
//       users = querySnapshot.docs.map((doc) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         return User(
//           id: data['id'],
//           name: data['name'],
//           friends: List<int>.from(data['friends']),
//           interests: List<String>.from(data['interests']),
//         );
//       }).toList();
//     });
//   }

  // List<User> filterUsersByInterest(String interest) {
  //   return users.where((user) => user.interests.contains(interest)).toList();
  // }