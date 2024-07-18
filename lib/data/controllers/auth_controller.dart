import 'dart:convert';

import 'package:crud_app/data/models/create_product_data_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
 static CreateProductDataList? uerData;

 static Future<void>saveUserData(CreateProductDataList userData) async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('userData', jsonEncode(uerData?.toJson()));
  AuthController.uerData = userData;
 }
 static Future<CreateProductDataList?> getUserData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? result = sharedPreferences.getString('userData');
  if (result == null) {
   return null;
  }
  final user =  CreateProductDataList.fromJson(jsonDecode(result));
  AuthController.uerData = user;
  return user;
 }
}