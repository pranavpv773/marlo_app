import 'package:flutter/widgets.dart';
import 'package:marlo_app/app/app_style/app_theme/app_theme.dart';
import 'package:marlo_app/app/app_style/app_theme/custom_theme.dart';

class HomeNotifier with ChangeNotifier {
  bool checked = false;

  bool checkBox(BuildContext context) {
    if (checked == true) {
      checked = false;
      CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
      notifyListeners();
    } else {
      checked = true;
      CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.DARK);
      notifyListeners();
    }
    notifyListeners();
    return checked;
  }
}
