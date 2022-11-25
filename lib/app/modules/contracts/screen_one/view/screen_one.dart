import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marlo_app/app/app_routes/app_routes.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';
import 'package:marlo_app/app/app_style/app_textstyle/text_styles.dart';
import 'package:marlo_app/app/modules/contracts/screen_one/view_model/contract_notifier.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/view/invite.dart';
import 'package:provider/provider.dart';

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
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "All People • ${context.read<ContractNotifier>().teamModel[0].data!.contacts!.length}"),
                TextButton(onPressed: () {}, child: const Text("See all"))
              ],
            ),
          ),
          SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  final datas = context.read<ContractNotifier>().teamModel;
                  return ListTile(
                    leading: Container(
                      width: 50.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.w)),
                        color: AppColors.peopleAvathar,
                      ),
                      child: Center(
                        child: Text(
                            "${datas[0].data!.contacts![index].firstname[0].toString().toCapitalized()} ${datas[0].data!.contacts![index].lastname[0].toString().toCapitalized()}"),
                      ),
                    ),
                    title: Text(
                        "${datas[0].data!.contacts![index].firstname.toCapitalized()} ${datas[0].data!.contacts![index].lastname.toCapitalized()}"),
                    subtitle: Text(
                        datas[0].data!.contacts![index].isactive == true
                            ? "Active"
                            : "Inactive"),
                    trailing: Text(datas[0]
                        .data!
                        .contacts![index]
                        .roleName
                        .toString()
                        .substring(5)),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Invited People • ${context.read<ContractNotifier>().teamModel[0].data!.invites!.length}"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See all",
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  final datas = context.read<ContractNotifier>().teamModel;
                  return ListTile(
                    leading: Container(
                      width: 50.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.w)),
                        color: AppColors.inviteAvathar,
                      ),
                      child: Center(
                        child: Text(datas[0]
                            .data!
                            .invites![index]
                            .email![0]
                            .toString()
                            .toUpperCase()),
                      ),
                    ),
                    title:
                        Text(datas[0].data!.invites![index].email.toString()),
                    subtitle: Text(datas[0]
                        .data!
                        .invites![index]
                        .configName
                        .toString()
                        .substring(5)),
                  );
                }),
          )
        ],
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
