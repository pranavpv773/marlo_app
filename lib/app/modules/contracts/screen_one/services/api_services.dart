import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:marlo_app/app/api_services/api_endpoints.dart';
import 'package:marlo_app/app/modules/contracts/screen_one/model/team_model.dart';

class TeamApiServices {
  Future<TeamModel> fetchTeam() async {
    log('reached fn');
    final dio = Dio();
    try {
      dio.options.headers["authtoken"] = ApiEndpoints.token;
      Response response = await dio.get(ApiEndpoints.teamUrl);
      if (response.statusCode == 200) {
        log('reached success');
        return TeamModel.fromJson(response.data);
      } else {
        log('reached else');

        return TeamModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return TeamModel(message: e.message, status: false);
    } catch (e) {
      log('reached error');

      log(e.toString());
      return TeamModel(message: e.toString(), status: false);
    }
  }
}
