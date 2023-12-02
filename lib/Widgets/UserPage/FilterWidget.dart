import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controller/UsersController.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 53, 53, 53),
      ),
      child: GetBuilder<UserController>(builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          const Text('Filter',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Row(
            children: [
              Checkbox(
                value: controller.isFiltered,
                activeColor: Colors.black,
                onChanged: (bool? value) {
                  controller.filterUsersByInterest();
                },
              ),
              const Text('Group By interests',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ]);
      }),
    );
  }
}
