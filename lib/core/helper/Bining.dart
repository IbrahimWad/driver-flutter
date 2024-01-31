import 'package:driver/core/controller/AuthViewModel.dart';
import 'package:driver/core/controller/getOrdersController.dart';
import 'package:driver/core/controller/messageViewModel.dart';
import 'package:driver/core/controller/theClientViewModel.dart';
import 'package:driver/view/Auth/carDetails.dart';
import 'package:driver/view/Auth/createAccount.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => CreateAccount());
    Get.lazyPut(() => CarDetails());
    Get.lazyPut(() => GetOrderController());
    Get.lazyPut(() => TheClientViewModel());
    Get.lazyPut(() => MessageController());
    // TODO: implement dependencies
  }
}
