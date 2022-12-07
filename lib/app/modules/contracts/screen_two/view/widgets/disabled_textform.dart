// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/view_model/invite_notifier.dart';
import 'package:provider/provider.dart';

class DisabledTextformFieldWidget extends StatelessWidget {
  const DisabledTextformFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondary.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          //enabled: false,
          controller: context.read<InviteNotifier>().roleCntrl,
          validator: (value) {
            if (value!.isEmpty) {
              return " Please fill this field";
            }
          },
          decoration: InputDecoration(
            fillColor: AppColors.secondary.withOpacity(0.02),
            filled: true,
            suffixIcon: IconButton(
              onPressed: () {
                context.read<InviteNotifier>().settingModalBottomSheet(context);
              },
              icon: Iconify(
                Ri.arrow_drop_down_line,
                size: 24.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppColors.secondary.withOpacity(0.01),
                width: 0.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppColors.secondary.withOpacity(0.01),
                width: 0.0,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
