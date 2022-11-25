import 'package:flutter/material.dart';
import 'package:marlo_app/app/app_style/app_images/app_images.dart';
import 'package:marlo_app/app/modules/splash/view_model/splash_notifier.dart';
import 'package:provider/provider.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Center(
            child: Image.asset(AppImages.noInternet),
          ),
          TextButton(
              onPressed: () {
                context.read<SplashNotifier>().goScreenOne(context);
              },
              child: const Text("Try Again"))
        ],
      ),
    );
  }
}
