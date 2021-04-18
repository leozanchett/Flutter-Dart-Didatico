import 'dart:convert';

import 'package:apicomgetx/https/request.dart';
import 'package:apicomgetx/https/url.dart';
import 'package:apicomgetx/modules/userList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userListData = List<Data>().obs;
  @override
  void onInit() {
    _apiGetUserList();
    super.onInit();
  }

  void _apiGetUserList() async {
    Future.delayed(Duration.zero, () => Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false));

    Requests request = Requests(url: urlUserList, body: null);
    request.get().then((value) {
      UserListModel userListModel = UserListModel.fromJson(json.decode(value.body));
      userListData.value = userListModel.data;
      Get.back();
    }).catchError((onError) {
      print(onError);
    });
  }

  void deleteItem(int index) {
    userListData.removeAt(index);
  }
}
