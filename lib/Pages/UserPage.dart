import 'package:app_test/Components/UserComponenets.dart';
import 'package:app_test/Controller/UsersController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            userController.onfilter();
          },
          child: GetBuilder<UserController>(builder: (controller) {
            return controller.icon;
          }),
        ),
        body: GetBuilder<UserController>(builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!controller.isFiltered) {
            return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (BuildContext context, int index) {
                return UserComponent(
                    color: const Color.fromARGB(255, 237, 237, 237),
                    id: controller.users[index].id!,
                    name: controller.users[index].name.toString(),
                    friends: controller.users[index].friends!,
                    interests: controller.users[index].interests!);
              },
            );
          }
          return ListView.builder(
            itemCount: controller.filteredUsers.length,
            itemBuilder: (BuildContext context, int index) {
              return UserComponent(
                  color: const Color.fromARGB(255, 237, 237, 237),
                  id: controller.filteredUsers[index].id!,
                  name: controller.filteredUsers[index].name.toString(),
                  friends: controller.filteredUsers[index].friends!,
                  interests: controller.filteredUsers[index].interests!);
            },
          );
        }));
  }
}
