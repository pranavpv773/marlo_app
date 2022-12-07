// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/view_model/invite_notifier.dart';
import 'package:provider/provider.dart';

class TextformFieldWidget extends StatelessWidget {
  const TextformFieldWidget({
    Key? key,
    required this.title,
    this.icon1,
  }) : super(key: key);
  final String title;
  final Widget? icon1;
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
          controller: context.read<InviteNotifier>().emailCntrl,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              context.read<InviteNotifier>().isValidEmail(value)
                  ? null
                  : "Invalid mail";
            }
          },
          decoration: InputDecoration(
            fillColor: AppColors.secondary.withOpacity(0.02),
            filled: true,
            suffixIcon: icon1 ??
                const SizedBox(
                  width: 0,
                ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppColors.secondary.withOpacity(0.01),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppColors.secondary.withOpacity(0.01),
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppColors.secondary.withOpacity(0.01),
                width: 2.0,
              ),
            ),
            labelText: title,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
