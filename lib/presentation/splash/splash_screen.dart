import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:choosing_door_game/application/infrastructure/modules/home_module.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("O Jogo das Caixas"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.ac_unit,
                size: 40,
              ),
              InkWell(
                onTap: (){
                  Get.offNamed(HomeModule.routePaths.home);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text(
                    "JOGAR",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
