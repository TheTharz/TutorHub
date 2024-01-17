import 'package:flutter/material.dart';
import 'package:tutorhub/common/widgets/containers/circular_container.dart';
import 'package:tutorhub/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:tutorhub/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
          color: TColors.primaryColor,
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                Positioned(
                  top: -150,
                  right: -250,
                  child: CircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -300,
                  child: CircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
                child,
              ],
            ),
          )),
    );
  }
}
