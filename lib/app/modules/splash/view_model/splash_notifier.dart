import 'package:flutter/widgets.dart';
import 'package:marlo_app/app/app_routes/app_routes.dart';
import 'package:marlo_app/app/modules/global/view/global.dart';

class SplashNotifier with ChangeNotifier {
  SplashNotifier() {
    goScreenOne();
  }
  goScreenOne() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    AppRoutes.removeScreenUntil(
      screen: const GlobalScreen(),
    );
  }
}
