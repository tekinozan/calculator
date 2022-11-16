import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../utils/colors.dart';
import 'package:calculator_app/results.dart';

class TemperatureCalculator extends StatefulWidget {
  const TemperatureCalculator({Key? key}) : super(key: key);

  @override
  State<TemperatureCalculator> createState() => _TemperatureCalculatorState();
}

class _TemperatureCalculatorState extends State<TemperatureCalculator> {
  double celcius = 0,fahrenheit = 0,kelvin = 0;

 Conversions conversion = Conversions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
          children: [
            SizedBox(height: 150,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      SleekCircularSlider(
      min: -400,
          max: 400,
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
                trackColor: Colors.redAccent,
                progressBarColors: [Colors.red, Colors.blueAccent],
                shadowMaxOpacity: 20.0),
            infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 18
              ),
              modifier: (value) {
                return '${celcius.ceil().toInt()}℃';
              },
            ),
          ),
          initialValue: 0,
          onChange: (value) {
            setState(() {
              celcius = value;
            });
            print(celcius);
          }),
        Container( padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery
                .of(context)
                .size
                .width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor("#ECF2FE"),
            ),
            child: Center(child: Text(conversion.celcius(celcius))))
      ],
    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: (){
                      setState(() {
                        celcius--;
                      });
                      print(celcius);
                    },
                    child: circleBtn("-")
                ),
                Text(
                  "${celcius.ceil().toInt()}℃",
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 22,
                  ) ,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        celcius++;
                      });
                      print(celcius);
                    },
                    child: circleBtn("+")
                ),
              ],
            ),

            SizedBox(height: 100,),

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    SleekCircularSlider(
      min: -400,
      max: 400,
      appearance: CircularSliderAppearance(
        customColors: CustomSliderColors(
        trackColor: Colors.redAccent, progressBarColors:
        [Colors.red, Colors.blueAccent], shadowMaxOpacity: 20.0),
        infoProperties: InfoProperties(
          mainLabelStyle: TextStyle(
            color: AppColor.textColor,
            fontSize: 18
          ),
          modifier: (value) {
          return '${fahrenheit.ceil().toInt()}℉';
          },
        ),
      ),
      initialValue: 0,
      onChange: (value) {
      setState(() {
        fahrenheit = value;
               });
            }
          ),
      Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 9,
          width: MediaQuery
              .of(context)
              .size
              .width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#ECF2FE"),
          ),child: Center(child: Text(conversion.fahrenheit(fahrenheit))))
        ],
      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: (){
                      setState(() {
                        fahrenheit--;
                      });
                      print(fahrenheit);
                    },
                    child: circleBtn("-"),),
                Text(
                  "${fahrenheit.ceil().toInt()}℉",
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 22,
                  ) ,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        fahrenheit++;
                      });
                      print(celcius);
                    },
                    child: circleBtn("+")
                ),
              ],
            ),
      ],),
    );
  }
  Container circleBtn(String str){
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: AppColor.btnColor,
          shape: BoxShape.circle
      ),
      child: Center(
        child:Text(
        str,style:TextStyle(
        fontSize: 22,
      ) ,),)

    );
  }
}
