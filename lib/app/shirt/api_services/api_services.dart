// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
import 'package:menz_cart_app/app/shirt/view_model/shit_provider.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';
import 'package:provider/provider.dart';

class ShirtApiServices {
  static fetchProducts(BuildContext context) async {
    context.read<ShirtProvider>().shirtMapList.clear();
    log('reached Login');
    try {
      Response response = await Dio().get(ApiEndPoints.getShirts);
      if (response.statusCode == 200) {
        final jsonData = response.data as List;
        final newList = jsonData.map((e) => ShirtModel.fromJson(e)).toList();
        return newList;
      } else {
        return EmailSigninResp.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return EmailSigninResp.fromJson(e.response!.data);
    } catch (e) {
      print(e.toString());
      return EmailSigninResp(status: false, message: e.toString());
    }
  }
}
