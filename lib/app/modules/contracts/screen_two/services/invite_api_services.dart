import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:marlo_app/app/api_services/api_endpoints.dart';
import 'package:marlo_app/app/modules/contracts/screen_two/model/invite_model.dart';

class ApiService {
  Future<InviteModel> inviteApi(Datas data) async {
    final dio = Dio();

    try {
      log("try");
      dio.options.headers["authtoken"] = ApiEndpoints.token;
      Response response = await dio.post(ApiEndpoints.inviteUrl,
          data: data.toJson(), options: Options());
      if (response.statusCode! >= 200) {
        log("success");
        return InviteModel.fromJson(response.data);
      } else {
        log("error");

        return InviteModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("dio error");

      return InviteModel(message: e.message);
    } catch (e) {
      log(e.toString());
      return InviteModel(message: e.toString());
    }
  }
}
