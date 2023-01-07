import '../../../di/service_locator.dart';
import '../../../ui/home/controller.dart';
import '../../../ui/home/new_user_page.dart';
import '../../../ui/home/widgets/add_user_form.dart';
import 'package:flutter/material.dart';

class AddUserBtn extends StatelessWidget {
  AddUserBtn({
    Key? key,
  }) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return UserForm(
              homeController: homeController,
              onSubmit: () async {
                await homeController.addNewUser();
                Navigator.pop(context);
                homeController.nameController.clear();
                homeController.jobController.clear();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewUserPage(),
                  ),
                );
              },
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
