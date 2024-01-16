import 'package:flutter/material.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';

import '../../../../../common/widgets/image_text_widgets/verticle_image_with_text.dart';

class PopularTutors extends StatelessWidget {
  const PopularTutors({
    super.key,
    required this.tutors,
  });

  final List<UserModel> tutors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: tutors.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final tutor = tutors[index];
            return VerticleImageText(
                image: 'https://picsum.photos/200/300',
                title: tutor.username,
                onTap: () {});
          }),
    );
  }
}
