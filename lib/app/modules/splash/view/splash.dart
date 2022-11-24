import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';
import 'package:marlo_app/app/app_style/app_images/app_images.dart';
import 'package:marlo_app/app/app_style/app_textstyle/text_styles.dart';
import 'package:marlo_app/app/modules/splash/view_model/splash_notifier.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SplashNotifier>().goScreenOne();
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primary.withOpacity(
          0.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.teams,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "If everyone is moving forward together,then success takes care of itself",
                style: AppTextstyles.h1.copyWith(
                  fontSize: 24.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
