import 'package:flutter/material.dart';
import 'package:noteyio_flutter/router.dart';
import 'package:noteyio_flutter/services/navigationservice.dart';
import 'package:noteyio_flutter/views/authentication/intro_view.dart';
import 'package:noteyio_flutter/views/authentication/login/login_view.dart';
import 'package:noteyio_flutter/views/basemodel.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

Future<void> main() async {
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
        primarySwatch: Colors.blue,
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