import 'package:get/get.dart';
import '/core/network/dio_injection.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(getDio());
  }
}
