import 'package:flutter/material.dart';

import '../../../features/authentication/models/user_model.dart';

class VerticleImageText extends StatelessWidget {
  const VerticleImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
    required this.tutor,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final UserModel tutor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            //circle icon
            Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 40,
                )),

            const SizedBox(height: 8),

            // text at the bottom
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
