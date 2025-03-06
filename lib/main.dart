import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/utils/MyBlocObserver.dart';
import 'package:ecommerce_app/core/utils/app_secure_storage.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await checkIfLoggedIn();
  Bloc.observer = MyBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: isLoggedIn ? Routes.mainRoute : Routes.signInRoute,
      ),
    );
  }
}

bool isLoggedIn = false;
checkIfLoggedIn() async {
  String? token = await AppSecureStorage.getToken();
  if (token != null) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
