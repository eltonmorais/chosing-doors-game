import 'package:choosing_door_game/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:choosing_door_game/application/infrastructure/modules/home_module.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with Moduler{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choosing Doors Game',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      onGenerateRoute: routeTo,
      onUnknownRoute: unknownRoute,
      navigatorObservers: [modulerRouteObserver],
      navigatorKey: Get.key,
    );
  }

   @override
  List<Module> get modules => [
    HomeModule(),
  ];

  @override
  List<Injector> get globalInjections => [];
}