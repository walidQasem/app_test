import 'package:app_test/Controller/UsersController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../Components/UserComponenet.dart';

class ListUsersWidget extends StatelessWidget {
  const ListUsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Expanded(
        child: ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimatedContainer(
              duration: Duration(microseconds: 300 + (index * 100)),
              child: UserComponent(
                  color: const Color.fromARGB(255, 74, 74, 74),
                  id: controller.list[index].id!,
                  name: controller.list[index].name.toString(),
                  friends: controller.list[index].friends!,
                  interests: controller.list[index].interests!),
            );
          },
        ),
      );
    });
  }
}
