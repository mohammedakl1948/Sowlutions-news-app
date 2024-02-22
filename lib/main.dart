import 'package:fintrch/app/modules/login-page/bindings/login_page_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  Get.updateLocale(Get.deviceLocale!);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = GetStorage().read('locale');

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: Size(428, 926),
        builder: (context, child) {
          return GetMaterialApp(
            translationsKeys: AppTranslation.translations,
            locale: locale != null ? Locale(locale, '') : null,
            fallbackLocale: Locale('en', ''),
            textDirection: locale == 'ar' ? TextDirection.rtl : TextDirection.ltr,
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            initialBinding: LoginPageBinding(),
            getPages: AppPages.routes,
            theme: ThemeData(
              fontFamily: "Quicksand",
            ),
          );
        },
      ),
    );
  }
}