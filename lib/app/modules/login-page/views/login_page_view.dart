import 'package:fintrch/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:fintrch/app/routes/app_pages.dart';
import 'package:fintrch/generated/locales.g.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../global/constants.dart';


class LoginPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image or color for splash
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'), // Change this to your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered button
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.HOMEPAGE); // Navigate to next route
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Colors.blue, // Change this to your desired button color
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18.sp, // Using ScreenUtil for responsive font size
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}