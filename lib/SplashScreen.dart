import 'dart:async';
import 'package:bmi_2/mainv2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMI_SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<BMI_SplashScreen> {
  @override
  void initState() {
    super.initState();
    WhereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BMI_logo());
  }
  WhereToGo() async {
      Timer(Duration(seconds:2),(){
        Navigator.pushReplacement(
            context, MaterialPageRoute(
          builder: (context) => BMI_v2_FrontPage(),
        )
        );
      });
  }
}

class BMI_logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
        width: _width,
        height: _height,
        color: Colors.lightBlueAccent,

        child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
          Center(
            child:BMI_Logo1(_width),
          ),
          BMI_Logo2(_width)
        ]));
  }
}

class BMI_Logo1 extends StatelessWidget{
  var _width;
  BMI_Logo1(this._width);
  @override
  Widget build(BuildContext context){
    return  Text('BMI',
    style: TextStyle(
    fontFamily: 'prince',
    fontSize: _width * 0.1,
    color: Colors.black87,
    ));
  }

}

class BMI_Logo2 extends StatelessWidget {
  var _width;
  BMI_Logo2(this._width);
  @override
  Widget build(BuildContext context) {
    return Text('calculator',
        style: TextStyle(
          fontFamily: 'raj',
          fontSize: _width*0.085,
          fontWeight: FontWeight.bold,
        ));
  }


}
