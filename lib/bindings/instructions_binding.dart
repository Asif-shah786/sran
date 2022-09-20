import 'package:get/get.dart';

import '../controllers/instructions_controller.dart';

class InstructionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstructionsController>(
      () => InstructionsController(),
    );
  }
}
