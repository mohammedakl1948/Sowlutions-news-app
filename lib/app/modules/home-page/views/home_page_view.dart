import 'package:fintrch/app/modules/home-page/controllers/home_page_controller.dart';
import 'package:fintrch/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:fintrch/generated/locales.g.dart';
import 'package:fintrch/global/widgets/news_widget.dart';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../global/constants.dart';


class HomePageView extends GetView<HomePageController> {

  void _onItemTapped(int index) {
    controller.selectedIndex.value = index;
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
              () => AlertDialog(
            title: Text('Apply Filters'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'author',
                      groupValue: controller.selectedSearchAttribute.value,
                      onChanged: (value) {
                        controller.setSelectedSearchAttribute(value!);
                      },
                    ),
                    Text('Author'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'title',
                      groupValue: controller.selectedSearchAttribute.value,
                      onChanged: (value) {
                        controller.setSelectedSearchAttribute(value!);
                      },
                    ),
                    Text('Title'),
                  ],
                ),
                SizedBox(height: 20),
                Text('Max Number of Articles:'),
                Slider(
                  value: controller.numberOfArticles.toDouble(),
                  onChanged: (newValue) {
                    controller.setNumberOfArticles(newValue.toInt());
                  },
                  min: 1,
                  max: 100,
                  divisions: 100,
                  label: controller.numberOfArticles.toString(),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  controller.applyFilters();
                  Navigator.of(context).pop();
                },
                child: Text('Apply'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widgetOptions = [
      NewsListView(controller: controller),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => _showFilterDialog(context),
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: Obx(() => widgetOptions.elementAt(controller.selectedIndex.value)),
    );
  }
}