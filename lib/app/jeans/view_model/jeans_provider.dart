// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/jeans/api_services/api_services.dart';
import 'package:menz_cart_app/app/jeans/api_services/fit_categories.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';

class JeansProvider with ChangeNotifier {
  JeansProvider() {
    fetchJeans();
  }
  List<Jeans> jeansList = [];
  List<Jeans> jeansFitList = [];
  Future<void> fetchJeans() async {
    JeansModel resp = await JeansApiService().fetchProducts();

    if (resp.status && resp.jeans.isNotEmpty) {
      jeansList.clear();
      log(resp.jeans.toString());
      jeansList.addAll(resp.jeans);
      notifyListeners();
      log(jeansFitList.length.toString());
      allProducts.addAll(jeansList);
      log(allProducts.length.toString());
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchJeansFit(String fit) async {
    jeansFitList.clear();
    log('first');
    JeansModel resp =
        await JeansFitApiServices().fetchJeansfit(fit.toLowerCase());

    if (resp.status && resp.jeans.isNotEmpty) {
      jeansFitList.clear();
      log(resp.toString());
      jeansFitList.addAll(resp.jeans);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
