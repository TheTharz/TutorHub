import 'package:flutter/material.dart';

class NotificationCounterIcon extends StatelessWidget {
  const NotificationCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: iconColor,
            )),
        Positioned(
            right: 0,
            child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Text("4",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.white, fontSizeFactor: 0.8)))))
      ],
    );
  }
}
