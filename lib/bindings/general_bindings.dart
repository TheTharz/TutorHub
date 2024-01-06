import 'package:get/get.dart';
import 'package:tutorhub/utils/helpers/network/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
