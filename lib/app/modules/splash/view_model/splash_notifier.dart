import 'package:flutter/widgets.dart';
import 'package:marlo_app/app/app_routes/app_routes.dart';
import 'package:marlo_app/app/modules/screen_one/view/screen_one.dart';

class SplashNotifier with ChangeNotifier {
  goScreenOne() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    AppRoutes.removeScreen(
      screen: const ScreenOne(),
    );
  }
}
