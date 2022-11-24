import 'package:flutter/material.dart';
import 'package:marlo_app/app/modules/global/view_model/global_notifier.dart';
import 'package:provider/provider.dart';

import 'widgets/bottom_nav.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context
          .watch<GlobalNotifier>()
          .pages[context.read<GlobalNotifier>().selectIndex],
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
