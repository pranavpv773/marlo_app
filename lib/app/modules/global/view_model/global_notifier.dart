import 'package:flutter/widgets.dart';
import 'package:marlo_app/app/modules/chart/chart.dart';
import 'package:marlo_app/app/modules/contracts/screen_one/view/screen_one.dart';
import 'package:marlo_app/app/modules/home/view/home.dart';
import 'package:marlo_app/app/modules/loans/loan.dart';
import 'package:marlo_app/app/modules/teams/teams.dart';

class GlobalNotifier with ChangeNotifier {
  int selectIndex = 2;
  List pages = [
    const HomeScreen(),
    const LoanScreen(),
    const ScreenOne(),
    const TeamsScreen(),
    const ChartScreen(),
  ];
  onIndexChange(int value) {
    selectIndex = value;
    notifyListeners();
  }
}
