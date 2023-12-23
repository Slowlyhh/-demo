import 'dart:io';

import 'package:demo/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomeLogic extends GetxController {

  RxList<Subjects> inFowList = <Subjects>[].obs;
  TextEditingController searcherController = TextEditingController();
  RxString text = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }


  Future<void> getInfoList(String text) async {
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    var url = 'https://api.douban.com/v2/movie/search?q=$text';
    try {
      var response = await dio.post(
        url,
        data: {'apikey': '0ab215a8b1977939201640fa14c66bab'},
        options: Options(
            contentType: Headers.formUrlEncodedContentType),
      );
      final List<dynamic> responseData = response.data['subjects'];
     final List<Subjects>  jsonList = responseData.map((e) => Subjects.fromJson(e)).toList();
     inFowList.clear();
      inFowList.addAll(jsonList);
      print('图片地址：${inFowList[0].images.small}');
    } catch (error) {
      print('Dio postJson fail: $error');
    }
  }
}
