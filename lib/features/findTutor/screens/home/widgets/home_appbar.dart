import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/notifications/notification_icon.dart';
import '../../../../personalization/controllers/user_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      title: Row(
        children: [
          if (controller.user.value.picture != null)
            Obx(
              () => CircleAvatar(
                backgroundImage: NetworkImage(controller.user.value.picture!),
                radius: 20,
              ),
            ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome to learning ...",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.grey)),
              Obx(
                () => Text(controller.user.value.username,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.white)),
              )
            ],
          ),
        ],
      ),
      actions: [
        NotificationCounterIcon(
          onPressed: () {},
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
