import 'package:get/get.dart';
import 'package:widgets/core/network/dio_injection.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(getDio());
  }
}
