import 'package:flutter/material.dart';
import 'package:tutorhub/common/widgets/appbar/appbar.dart';
import 'package:tutorhub/common/widgets/curved_edges/curved_edges.dart';
import 'package:tutorhub/features/findTutor/screens/home/widgets/home_appbar.dart';
import 'package:tutorhub/utils/constants/colors.dart';

import '../../../../common/widgets/containers/circular_container.dart';
import '../../../../common/widgets/containers/primary_header_container.dart';
import '../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/notifications/notification_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        PrimaryHeaderContainer(
            child: Column(
          children: [
            //app bar
            HomeAppBar()
            //searchbar

            // top teachers now
          ],
        )),
      ],
    )));
  }
}
