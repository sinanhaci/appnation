import 'dart:io';
import 'package:appnation/services/api_services/base_api_services/base_api_constants.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

class BaseApiServices extends BaseApiConstants{
  Future<dynamic> responseHandle<T>({
    required Function request,
    required Function(String? response) callBackSuccess,
  }) async {
    Response? response;
    try {
      response = await request();
      if (response != null) {
        switch (response.statusCode) {
          case 200:
            return callBackSuccess(response.body);
          default:
            return callBackSuccess(null);
        }
      }
    } on SocketException {
      return await callBackSuccess(null);
    } catch (exception) {
      return await callBackSuccess(null);
    } finally {
      if (response != null) {
        if (kDebugMode) {
          print(response.statusCode);
          print(response.request?.url);
          print(response.body);
        }
      }
    }
  }
}
