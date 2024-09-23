import 'package:get/get.dart';

import '../controllers/common_controller/auth/change_password_controller.dart';
import '../controllers/common_controller/auth/forget_password_controller.dart';
import '../controllers/common_controller/auth/sign_in_controller.dart';
import '../controllers/common_controller/auth/sign_up_controller.dart';
import '../controllers/common_controller/message/chat_controller.dart';
import '../controllers/common_controller/message/message_controller.dart';
import '../controllers/common_controller/notifications/notifications_controller.dart';
import '../controllers/common_controller/profile/profile_controller.dart';
import '../controllers/common_controller/setting/privacy_policy_controller.dart';
import '../controllers/common_controller/setting/setting_controller.dart';
import '../controllers/common_controller/setting/terms_of_services_controller.dart';
import '../controllers/provider/my_task_controller.dart';
import '../controllers/provider/provider_controller.dart';
import '../controllers/provider/task_details_controller.dart';
import '../controllers/worker/wallet/my_wallet_controller.dart';
import '../controllers/worker/wallet/withdraw_controller.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsOfServicesController(), fenix: true);
    Get.lazyPut(() => ProviderHomeController(), fenix: true);
    Get.lazyPut(() => TaskDetailsController(), fenix: true);
    Get.lazyPut(() => MyTaskController(), fenix: true);
    Get.lazyPut(() => MyWalletController(), fenix: true);
    Get.lazyPut(() => WithdrawController(), fenix: true);
  }
}
