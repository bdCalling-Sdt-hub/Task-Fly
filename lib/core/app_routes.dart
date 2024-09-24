import 'package:get/get.dart';
import 'package:task_fly/view/screen/common_screen/profile/personal_info_screen.dart';
import 'package:task_fly/view/screen/services_provider/home/provider_home.dart';
import 'package:task_fly/view/screen/services_provider/location/location_screen.dart';
import 'package:task_fly/view/screen/services_provider/my_task/my_task_screen.dart';
import 'package:task_fly/view/screen/services_provider/task_details/task_details_screen.dart';
import 'package:task_fly/view/screen/worker/Post_task/worker_post_task_screen.dart';
import 'package:task_fly/view/screen/worker/report/completed_screen.dart';
import 'package:task_fly/view/screen/worker/report/ongoing_screen.dart';
import 'package:task_fly/view/screen/worker/report/report_screen.dart';
import 'package:task_fly/view/screen/worker/wallet/my_wallet.dart';
import 'package:task_fly/view/screen/worker/wallet/withdraw_screen.dart';

import '../view/screen/common_screen/auth/change_password/change_password_screen.dart';
import '../view/screen/common_screen/auth/forgot password/create_password.dart';
import '../view/screen/common_screen/auth/forgot password/forgot_password.dart';
import '../view/screen/common_screen/auth/forgot password/verify_screen.dart';
import '../view/screen/common_screen/auth/sign in/sign_in_screen.dart';
import '../view/screen/common_screen/auth/sign up/sign_up_screen.dart';
import '../view/screen/common_screen/auth/sign up/verify_user.dart';
import '../view/screen/common_screen/message/chat_screen.dart';
import '../view/screen/common_screen/message/message_screen.dart';
import '../view/screen/common_screen/notifications/notifications_screen.dart';
import '../view/screen/common_screen/onboarding_screen/onboarding_screen.dart';
import '../view/screen/common_screen/profile/edit_profile.dart';
import '../view/screen/common_screen/profile/profile_screen.dart';
import '../view/screen/common_screen/setting/privacy_policy_screen.dart';
import '../view/screen/common_screen/setting/setting_screen.dart';
import '../view/screen/common_screen/setting/terms_of_services_screen.dart';
import '../view/screen/common_screen/splash/splash_screen.dart';
import '../view/screen/test_screen.dart';
import '../view/screen/worker/report/cancel_screen.dart';
import '../view/screen/worker/report/pending_screen.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String serviceProviderHome = "/provider_home.dart";
  static const String taskDetails = "/task_details_screen.dart";
  static const String location = "/location_screen.dart";
  static const String myTask = "/my_task_screen.dart";
  static const String personalInfo = "/personal_info_screen.dart";
  static const String myWallet = "/my_wallet.dart";
  static const String withdraw = "/withdraw_screen.dart";
  static const String workerPostTask = "/worker_post_task_screen.dart";
  static const String report = "/report_screen.dart";
  static const String cancelScreen = "/cancel_screen.dart";
  static const String completedScreen = "/completed_screen.dart";
  static const String ongoingScreen = "/ongoing_screen.dart";
  static const String pendingScreen = "/pending_screen.dart";

  static List<GetPage> routes = [
    GetPage(
        name: test,
        page: () => TestScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: splash,
        page: () => SplashScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: onboarding,
        page: () => OnboardingScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: signUp,
        page: () => SignUpScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: verifyUser,
        page: () => VerifyUser(),
        transition: Transition.cupertino),
    GetPage(
        name: signIn,
        page: () => SignInScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: forgotPassword,
        page: () => ForgotPasswordScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: verifyEmail,
        page: () => VerifyScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: createPassword,
        page: () => CreatePassword(),
        transition: Transition.cupertino),
    GetPage(
        name: changePassword,
        page: () => ChangePasswordScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: notifications,
        page: () => NotificationScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: chat,
        page: () => ChatListScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: message,
        page: () => MessageScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: profile,
        page: () => ProfileScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: editProfile,
        page: () => EditProfile(),
        transition: Transition.cupertino),
    GetPage(
        name: privacyPolicy,
        page: () => PrivacyPolicyScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: termsOfServices,
        page: () => TermsOfServicesScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: setting,
        page: () => SettingScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: serviceProviderHome,
        page: () => ServiceProviderHome(),
        transition: Transition.cupertino),
    GetPage(
        name: taskDetails,
        page: () => TaskDetailsScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: location,
        page: () => LocationScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: myTask,
        page: () => MyTaskScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: personalInfo,
        page: () => PersonalInfoScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.myWallet,
        page: () => MyWallet(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.withdraw,
        page: () => WithdrawScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.workerPostTask,
        page: () => WorkerPostTaskScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.report,
        page: () => ReportScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.cancelScreen,
        page: () => CancelScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.completedScreen,
        page: () => CompletedScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.ongoingScreen,
        page: () => OngoingScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.pendingScreen,
        page: () => const PendingScreen(),
        transition: Transition.cupertino),
  ];

}
