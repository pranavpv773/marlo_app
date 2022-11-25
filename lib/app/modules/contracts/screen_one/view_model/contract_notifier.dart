import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:marlo_app/app/modules/contracts/screen_one/model/team_model.dart';
import 'package:marlo_app/app/modules/contracts/screen_one/services/api_services.dart';

class ContractNotifier with ChangeNotifier {
  List<TeamModel> teamModel = [];
  fetchTeamFn() async {
    TeamModel resp = await TeamApiServices().fetchTeam();

    if (resp.errorFlag == "SUCCESS") {
      teamModel.add(resp);
      notifyListeners();
      log("added");
    } else {
      Fluttertoast.showToast(
        msg: resp.message.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
