import 'package:bmi_2/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(BMI_v2());
}

class BMI_v2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMI_SplashScreen(),

    );
  }
}

class BMI_v2_FrontPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BMI_FrontPage();
  }
}

class _BMI_FrontPage extends State<BMI_v2_FrontPage> {
  var _width = 0.0;
  Color vsu = Colors.white;
  Color su = Colors.white;
  Color u = Colors.white;
  Color n = Colors.white;
  Color o = Colors.white;
  Color o1 = Colors.white;
  Color o2 = Colors.white;
  Color o3 = Colors.white;

  var _height = TextEditingController();
  var _weight = TextEditingController();
  var result;
  Color col = Colors.black;
  var ans;

  // need to work on this

  // not working well
  double indicator(var result) {
    if (result <= 16) {
      _width = result * 0.0128125;
    } else if (result >= 16 && result < 17) {
      _width = ((result - 16) * 0.01) + 0.205;
    } else if (result >= 17 && result < 18.5) {
      _width = ((result - 17) * 0.01) + 0.305;
    } else if (result >= 18.5 && result < 25) {
      _width = ((result - 18.5) * 0.025) + 0.455;
    } else if (result >= 25 && result < 30) {
      _width = ((result - 25) * 0.015) + 0.605;
    } else if (result >= 30 && result < 35) {
      _width = ((result - 30) * 0.015) + 0.680;
    } else if (result >= 35 && result < 40) {
      _width = ((result - 35) * 0.015) + 0.755;
    } else if (result >= 40 && result < 49) {
      _width = ((result - 40) * 0.015) + 0.830;
    } else {
      _width = 0.965;
    }

    return _width;
  }

  void rang(var result) {
    if (result == -1) {
    } else if (result < 16) {
      vsu = Colors.blue.shade200;
    } else if (result >= 16 && result < 17) {
      su = Colors.blue.shade300;
    } else if (result >= 17 && result < 18.5) {
      u = Colors.blue.shade400;
    } else if (result >= 18.5 && result < 25) {
      n = Colors.green.shade300;
    } else if (result >= 25 && result < 30) {
      o = Colors.yellow.shade400;
    } else if (result >= 30 && result < 35) {
      o1 = Colors.amber.shade300;
    } else if (result >= 35 && result < 40) {
      o2 = Colors.orange.shade400;
    } else {
      o3 = Colors.red.shade300;
    }
  }

  var res1 = "0.0";
  var res;
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    var wid = MediaQuery.of(context).size.width;
    final _wid;
    final _hei;
    if (hei < wid) {
      _wid = MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          kToolbarHeight;
      _hei = MediaQuery.of(context).size.width;
    } else {
      _hei = MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          kToolbarHeight;
      _wid = MediaQuery.of(context).size.width;
    }

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/bgImage.jpg'),
            fit: BoxFit.cover,
          )),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Row(children: [
                Text('BMI',
                    style: TextStyle(
                      fontFamily: 'prince',
                      color: Colors.black87,
                    )),
                Text('calculator',
                    style: TextStyle(
                      fontFamily: 'raj',
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    )),
                Expanded(child: SizedBox()),
                InkWell(
                    child: Icon(Icons.refresh, size: 30, color: Colors.black),
                    onTap: () {
                      vsu = Colors.white;
                      su = Colors.white;
                      u = Colors.white;
                      n = Colors.white;
                      o = Colors.white;
                      o1 = Colors.white;
                      o2 = Colors.white;
                      o3 = Colors.white;
                      col = Colors.black;
                      _width = 0.0;
                      result = 0;
                      res1 = "0.0";
                      _height.clear();
                      _weight.clear();
                      setState(() {});
                    })
              ]),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: _hei * 0.04,
                    bottom: _hei * 0.01,
                    left: _wid * 0.01,
                    right: _wid * 0.01),
                child: Container(
                  height: _hei,
                  width: _wid,

                  //color: Colors.grey.shade50,
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Height',
                              style: TextStyle(
                                  fontFamily: 'text3',
                                  fontWeight: FontWeight.w500,
                                  fontSize: _wid * 0.05)),
                          Container(
                              height: _hei * 0.05,
                              constraints: const BoxConstraints(
                                maxHeight: 50,
                                //minHeight:5,
                                //maxWidth:100,
                                //minWidth:50,
                              ),
                              width: _wid * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius:
                                      BorderRadius.circular(_wid * 0.01)),
                              child: TextField(
                                maxLength: 4,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                controller: _height,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(_wid * 0.01),
                                    ),
                                    suffixText: "in Feet",
                                    suffixStyle:
                                        TextStyle(fontSize: _wid * 0.02)),
                                style: TextStyle(fontSize: _wid * 0.03),
                              )),
                        ]),
                    SizedBox(
                      height: _hei * 0.03,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Weight',
                              style: TextStyle(
                                  fontFamily: 'text3',
                                  fontWeight: FontWeight.w500,
                                  fontSize: _wid * 0.05)),
                          Container(
                            height: _hei * 0.05,
                            width: _wid * 0.3,
                            constraints: const BoxConstraints(maxHeight: 50),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.circular(_wid * 0.01)),
                            child: TextField(
                                maxLength: 4,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                controller: _weight,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(_wid * 0.01),
                                    ),
                                    suffixText: "in Kg",
                                    suffixStyle:
                                        TextStyle(fontSize: _wid * 0.02)),
                                style: TextStyle(fontSize: _wid * 0.03)),
                          ),
                        ]),
                    SizedBox(
                      height: _hei * 0.03,
                    ),
                    ElevatedButton(
                        child: const Text('Calculate',
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {
                          var ht = _height.text.toString();
                          var wt = _weight.text.toString();
                          if (ht != "" && wt != "") {
                            var iht = double.parse(ht);
                            var iwt = double.parse(wt);
                            int i = iht.floor();
                            double j = iht - i;
                            if (j < 10) {
                              j = j * 10;
                            } else if (j >= 10) {
                              j = j * 100;
                            }
                            ans = ((i * 12) + j) * (0.0254);
                            result = (iwt / (ans * ans));
                            _width = indicator(result);
                            res = result.toStringAsFixed(2);
                            res1 = res.toString();
                            col = Colors.black;
                          } else {
                            res1 = 'Please fill all the Requirements';
                            col = Colors.red;
                            result = -1;
                          }
                          setState(() {
                            vsu = Colors.white;
                            su = Colors.white;
                            u = Colors.white;
                            n = Colors.white;
                            o = Colors.white;
                            o1 = Colors.white;
                            o2 = Colors.white;
                            o3 = Colors.white;
                            rang(result);
                          });
                        }),
                    SizedBox(
                      height: _hei * 0.03,
                    ),
                    Stack(children: [
                      _row1(_wid, _hei),
                      Positioned(
                          left: _wid * (-0.08),
                          top: _hei * (0.018),
                          child: Row(children: [
                            AnimatedContainer(
                                duration: Duration(seconds: 2),
                                width: _wid * _width,
                                curve: Curves.decelerate),
                            Icon(Icons.arrow_drop_up, size: _hei * 0.08)
                          ]))
                    ]),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Text('Your BMI is...',
                        style: TextStyle(
                            fontFamily: 'text3',
                            fontWeight: FontWeight.w500,
                            fontSize: _hei * 0.018)),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Text('${res1}',
                        style: TextStyle(
                          fontFamily: 'BMI',
                          fontSize: _hei * 0.02,
                          fontWeight: FontWeight.bold,
                          color: col,
                        )),
                    SizedBox(
                      height: _hei * 0.02,
                    ),
                    Container(
                      height: _hei * 0.04,
                      width: _wid * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_hei * 0.01),
                        color: vsu,
                      ),
                      child: _row2(Colors.indigo, 'Very Severely underweight',
                          '<16.0', _wid, _hei),
                    ),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Container(
                      height: _hei * 0.04,
                      width: _wid * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_hei * 0.01),
                        color: su,
                      ),
                      child: _row2(Colors.indigoAccent, 'Severely underweight',
                          '16.0 - 16.9', _wid, _hei),
                    ),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Container(
                        height: _hei * 0.04,
                        width: _wid * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_hei * 0.01),
                          color: u,
                        ),
                        child: _row2(Colors.blue, 'Underweight', '17.0 - 18.4',
                            _wid, _hei)),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Container(
                        height: _hei * 0.04,
                        width: _wid * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_hei * 0.01),
                          color: n,
                        ),
                        child: _row2(Colors.green.shade500, 'Normal',
                            '18.5 - 24.9', _wid, _hei)),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Container(
                        height: _hei * 0.04,
                        width: _wid * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_hei * 0.01),
                          color: o,
                        ),
                        child: _row2(Colors.yellow, 'Overweight', '25.0 - 29.9',
                            _wid, _hei)),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Container(
                        height: _hei * 0.05,
                        width: _wid * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_hei * 0.01),
                          color: o1,
                        ),
                        child: _row2(Colors.amber, 'Obese Class |',
                            '30.0 - 34.9', _wid, _hei)),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Container(
                      height: _hei * 0.04,
                      width: _wid * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_hei * 0.01),
                        color: o2,
                      ),
                      child: _row2(Colors.orange, 'Obese Class ||',
                          '35.0 - 39.9', _wid, _hei),
                    ),
                    SizedBox(
                      height: _hei * 0.01,
                    ),
                    Container(
                        height: _hei * 0.04,
                        width: _wid * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_hei * 0.01),
                          color: o3,
                        ),
                        child: _row2(Colors.redAccent, 'Obese Class |||',
                            '>=40', _wid, _hei))
                  ])),
                ),
              ),
            )),
      ],
    );
  }
}

class _row1 extends StatelessWidget {
  var wid;
  var hei;
  _row1(this.wid, this.hei);
  @override
  Widget build(BuildContext) {
    return Container(
      height: hei * 0.06,
      width: wid * 1,
      child: Row(children: [
        Container(
            width: wid * 0.20,
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(hei * 0.01),
                    bottomLeft: Radius.circular(hei * 0.01)))),
        Container(width: wid * 0.1, color: Colors.indigoAccent),
        Container(width: wid * 0.15, color: Colors.blue),
        Container(width: wid * 0.15, color: Colors.green.shade500),
        Container(
          width: wid * 0.075,
          color: Colors.yellow,
        ),
        Container(
          width: wid * 0.075,
          color: Colors.amber,
        ),
        Container(
          width: wid * 0.075,
          color: Colors.orange,
        ),
        Container(
            width: wid * 0.15,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(hei * 0.01),
                    bottomRight: Radius.circular(hei * 0.01)))),
      ]),
    );
  }
}

class _row2 extends StatelessWidget {
  Color bgcolor;
  var text1;
  var text2;
  var wid;
  var hei;
  _row2(this.bgcolor, this.text1, this.text2, this.wid, this.hei);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: wid * 0.01, right: wid * 0.01),
      child: Row(children: [
        Icon(Icons.circle, color: bgcolor, size: wid * 0.04),
        SizedBox(width: wid * 0.02),
        Container(
          width: wid * 0.6,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('$text1',
                style: TextStyle(
                  fontFamily: 'text3',
                  fontSize: wid * 0.035,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        Expanded(child: SizedBox()),
        Text('$text2',
            style: TextStyle(
              fontFamily: 'prince',
              fontSize: wid * 0.03,
            )),
      ]),
    );
  }
}
