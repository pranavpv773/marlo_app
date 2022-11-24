import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marlo_app/app/app_routes/app_routes.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';
import 'package:marlo_app/app/app_style/app_textstyle/text_styles.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/view/invite.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Teams",
          style: AppTextstyles.h1,
        ),
        actions: [
          Icon(
            Icons.search,
            size: 24.w,
            color: AppColors.secondary,
          )
        ],
      ),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            AppRoutes.nextScreen(
              screen: const InviteScreen(),
            );
          },
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("All People - 3"),
              TextButton(onPressed: () {}, child: const Text("See all"))
            ],
          ),
        )
      ],
    );
  }
}
