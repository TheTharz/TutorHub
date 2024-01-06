import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/utils/helpers/loader/animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
            onWillPop: () async => false,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(children: [
                  const SizedBox(height: 250),
                  TAnimationLoaderWidget(
                    text: text,
                    animation: animation,
                  )
                ]))));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
