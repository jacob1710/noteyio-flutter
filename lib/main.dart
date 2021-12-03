import 'package:flutter/material.dart';
import 'package:noteyio/router.dart';
import 'package:noteyio/services/navigation_service.dart';
import 'package:noteyio/views/authentication/intro_view.dart';
import 'package:noteyio/views/authentication/login/login_view.dart';
import 'package:noteyio/views/basemodel.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'constants/app_styles.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteyIO',
      theme: ThemeData(
        primarySwatch: AppStyles.createMaterialColor(AppStyles.kPrimaryColor),
      ),
      home: ChangeNotifierProvider(
        create: (context) => BaseModel(),
        //child: AuthView(),
        child: IntroView(),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}