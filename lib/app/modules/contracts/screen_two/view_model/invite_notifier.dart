import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';
import 'package:marlo_app/app/app_style/app_textstyle/text_styles.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/model/invite_model.dart';
import 'package:provider/provider.dart';

import '../services/invite_api_services.dart';

class InviteNotifier with ChangeNotifier {
  final emailCntrl = TextEditingController();
  final roleCntrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List roles = ["Admin", "Approver", "Preparer", "Viewer", "Employee"];

  onTabCntrler(int index) {
    roleCntrl.text = roles[index];
    notifyListeners();
  }

  settingModalBottomSheet(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext ctx) {
        return Container(
          color: AppColors.secondary.withOpacity(0.08),
          height: 350.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Team roles"),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: roles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            onTabCntrler(index);
                          },
                          child: Consumer<InviteNotifier>(
                              builder: (context, val, _) {
                            return Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: val.roleCntrl.text == val.roles[index]
                                    ? AppColors.primary
                                    : AppColors.kLight,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    roles[index].toString(),
                                    style: AppTextstyles.h2.copyWith(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> onTabInvite() async {
    if (formKey.currentState!.validate()) {
      if (emailCntrl.text.isEmpty || roleCntrl.text.isEmpty) {
        Fluttertoast.showToast(
          msg: "Please fill email",
          toastLength: Toast.LENGTH_LONG,
        );
      } else {
        final data = Datas(
          email: emailCntrl.text.trim(),
          role: roleCntrl.text.trim(),
        );
        log(roleCntrl.text);
        log(emailCntrl.text);
        InviteModel resp = await ApiService().inviteApi(data);

        if (resp.message == "SUCCESS") {
          Fluttertoast.showToast(
            msg: resp.message.toString(),
            toastLength: Toast.LENGTH_LONG,
          );
        } else {
          Fluttertoast.showToast(
            msg: resp.message.toString(),
            toastLength: Toast.LENGTH_LONG,
          );
        }
      }
    }
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
