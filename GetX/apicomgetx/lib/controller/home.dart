import 'dart:convert';

import 'package:apicomgetx/https/request.dart';
import 'package:apicomgetx/https/url.dart';
import 'package:apicomgetx/modules/userList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Data> userListData = <Data>[].obs;
  RxBool loading = false.obs;
  RxInt pagAtual = 0.obs;
  @override
  void onInit() {
    _apiGetUserList();
    super.onInit();
  }

  void _apiGetUserList() async {
    loading.value = true;
    Future.delayed(Duration.zero, () => Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false));

    Requests request = Requests(url: urlUserList + pagAtual.toString(), body: null);
    request.get().then((value) {
      UserListModel userListModel = UserListModel.fromJson(json.decode(value.body));
      pagAtual.value = userListModel.page;
      userListData.value = userListModel.data;
      loading.value = false;
      Get.back();
    }).catchError((onError) {
      print(onError);
    });
  }

  void nextPage() {
    pagAtual = pagAtual + 1;
    userListData.clear();
    _apiGetUserList();
  }

  void previusPage() {
    pagAtual = pagAtual - 1;
    userListData.clear();
    _apiGetUserList();
  }

  bool get pagAnteriorAtual => (pagAtual > 0) && (userListData.isEmpty) && (!loading.value);

  void deleteItem(int index) {
    userListData.removeAt(index);
  }
}
