import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/bindings/global_bindings.dart';
import 'package:mobile/firebase_options.dart';
import 'package:mobile/global_settings.dart';
import 'package:mobile/routes/app_page.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/app_token.dart';
import 'package:mobile/utils/global_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Global.type = UserVariant.sme;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: ((context, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: FutureBuilder(
            future: UserToken.checkToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GetMaterialApp(
                  initialBinding: GlobalBinding(),
                  title: dotenv.env['PROJECT_TITLE']!,
                  theme: globalTheme(),
                  getPages: appPage(),
                  initialRoute: AppRoute.home,
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: child ?? Container(),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        );
      }),
    );
  }
}
