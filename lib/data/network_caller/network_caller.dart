import 'dart:convert';
import 'dart:developer';
import 'package:crud_app/data/models/network_response.dart';
import 'package:crud_app/presentation/ui/app.dart';
import 'package:crud_app/presentation/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      log(url);
      Response response = await get(Uri.parse(url));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          responseData: decode,
        );
      } else if (response.statusCode == 401) {
        _getErrorPushNav();
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
        );
      }
    } catch (errorCatch) {
      return NetworkResponse(
        responseCode: -1,
        isSuccess: false,
        errorMessage: errorCatch.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      log(url);
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        final enCodeData = jsonEncode(response.body);
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          responseData: enCodeData,
        );
      } else if (response.statusCode == 401) {
        _getErrorPushNav();
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
        );
      }
    } catch (errorCatch) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: errorCatch.toString(),
      );
    }
  }
}

void _getErrorPushNav() {
  Navigator.push(
    App.navigatorKey.currentState!.context,
    MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ),
  );
}
