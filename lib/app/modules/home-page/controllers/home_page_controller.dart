import 'dart:convert';
import 'dart:developer' as dev;
import 'package:fintrch/app/api/news_service.dart';
import 'package:fintrch/global/util_functions.dart';
import 'package:fintrch/global/widgets/news_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'package:get/get.dart';

class HomePageController extends GetxController {
  var articles = [].obs;
  var selectedIndex = 0.obs;
  var selectedSearchAttribute = 'author'.obs;
  var numberOfArticles = 1.obs;
  var query = new TextEditingController(text: 'example');
  @override
  void onInit() async {
    // TODO: implement onInit
    await fetchArticles();
    super.onInit();
  }
  @override
  Future<void> onReady() async {
    super.onReady();
  }

  void applyFilters() {

    fetchArticles();
  }

  fetchArticles() async {
    articles.value = (await fetchNewsArticles( query: query.text.toString(), max: numberOfArticles.toString(), titleOrAuthor: '${selectedSearchAttribute.toLowerCase()},description',)) ;
  }
  void setNumberOfArticles(int value) {
    numberOfArticles.value = value;
  }
  void setSelectedSearchAttribute(String value) {
    selectedSearchAttribute.value = value;
  }
}
