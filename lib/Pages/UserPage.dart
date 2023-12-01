import 'package:app_test/Components/UserComponenets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Model/UsersModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  void fetchUsers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    setState(() {
      users = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User.fromJson(data);
      }).toList();
    });
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  List<User> filteredUsers = [];
  filterUsersByInterest(String interest) {
    setState(() {
      filteredUsers =
          users.where((user) => user.interests!.contains(interest)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var user in users) {
            for (int i = 0; i < user.interests!.length; i++) {
              filterUsersByInterest(user.interests![i]);
            }
          }
        },
        child: Icon(Icons.filter_alt_outlined),
      ),
      body: filteredUsers.isEmpty
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return UserComponent(
                    color: Colors.deepPurple,
                    id: users[index].id!,
                    name: users[index].name.toString(),
                    friends: users[index].friends!,
                    interests: users[index].interests!);
              },
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return UserComponent(
                    color: const Color.fromARGB(255, 58, 183, 125),
                    id: filteredUsers[index].id!,
                    name: filteredUsers[index].name.toString(),
                    friends: filteredUsers[index].friends!,
                    interests: filteredUsers[index].interests!);
              },
            ),
    );
  }
}
