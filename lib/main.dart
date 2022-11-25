import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marlo_app/app/app_routes/app_routes.dart';
import 'package:marlo_app/app/modules/contracts/screen_one/view_model/contract_notifier.dart';
import 'package:marlo_app/app/modules/global/view_model/global_notifier.dart';
import 'package:marlo_app/app/modules/home/view_model/home_notifier.dart';
import 'package:marlo_app/app/modules/splash/view/splash.dart';
import 'package:marlo_app/app/modules/splash/view_model/splash_notifier.dart';
import 'package:provider/provider.dart';

import 'app/app_style/app_theme/app_theme.dart';
import 'app/app_style/app_theme/custom_theme.dart';

void main() {
  runApp(
    const CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => SplashNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => GlobalNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => ContractNotifier(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: AppRoutes.navigateKey,
              theme: CustomTheme.of(context),
              home: const SplashScreen(),
            );
          }),
    );
  }
}
