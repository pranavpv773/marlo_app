import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marlo_app/app/app_routes/app_routes.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';
import 'package:marlo_app/app/app_style/app_textstyle/text_styles.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/view/widgets/disabled_textform.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/view_model/invite_notifier.dart';
import 'package:provider/provider.dart';

import 'widgets/textform_field.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          splashColor: AppColors.primary,
          onPressed: () {
            AppRoutes.backScreen();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kDark,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: context.read<InviteNotifier>().formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Invite",
                    style: AppTextstyles.h1,
                  ),
                  const TextformFieldWidget(
                    title: "Bussiness email",
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: DisabledTextformFieldWidget(),
                  )
                ],
              ),
              SizedBox(
                width: 500.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primary),
                  ),
                  onPressed: () {
                    context.read<InviteNotifier>().onTabInvite();
                  },
                  child: const Text(
                    "Continue",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
