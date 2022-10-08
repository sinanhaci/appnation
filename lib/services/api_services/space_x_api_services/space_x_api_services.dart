import 'package:appnation/models/space_x_launch_models/space_x_launch_model.dart';
import 'package:appnation/services/api_services/base_api_services/base_api_services.dart';
import 'package:http/http.dart' as http;

class SpaceXApiServices extends BaseApiServices {
  Future<List<SpaceXLaunchModel>>? getLastMission() async {
    return await responseHandle<List<SpaceXLaunchModel>>(
      request: () async {
        return await http.get(getSpaceXApiUrl, headers: getTokenlessHeader);
      },
      callBackSuccess: (response) async {
        if (response != null) {
          return await spaceXLaunchModelFromJson(response);
        } else {
          return null;
        }
      },
    );
  }
}
