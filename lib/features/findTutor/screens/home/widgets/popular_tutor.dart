import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/verticle_image_with_text.dart';

class PopularTutors extends StatelessWidget {
  const PopularTutors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return VerticleImageText(
                image: 'assets/images/sample.jpg',
                title: 'Sinhala',
                onTap: () {});
          }),
    );
  }
}
