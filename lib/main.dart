import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_fly/services/socket_service.dart';
import 'core/app_routes.dart';
import 'core/dependency_injection.dart';
import 'helpers/prefs_helper.dart';
import 'languages/language.dart';
import 'services/notification_service.dart';
import 'theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection dI = DependencyInjection();
  dI.dependencies();
  await PrefsHelper.getAllPrefData();
  NotificationService.initLocalNotification();
  SocketServices.connectToSocket();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(428, 926),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        translations: LocalConstants(),
        defaultTransition: Transition.noTransition,
        locale: Locale(PrefsHelper.localizationLanguageCode,
            PrefsHelper.localizationCountryCode),
        fallbackLocale: const Locale("en", "US"),
        theme: themeData,
        transitionDuration: const Duration(milliseconds: 500),
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
