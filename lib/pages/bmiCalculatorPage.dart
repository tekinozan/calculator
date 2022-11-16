import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:calculator_app/results.dart';

import '../utils/colors.dart';

class BmiCalculator extends StatefulWidget {
  BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final weightController = TextEditingController();

  final heightController = TextEditingController();

  final _formKey = GlobalKey<FormState>;

  int  gender = 0;

  int bodyMassIndex = 0;

  int idealBodyWeight = 0;

  String bodyMassIndexRange ="";

  Color? changeColor;

  Results result = Results();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 100,),
                    Text("Select your gender",style: TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 10,),
                    GroupButton(
                        buttons: ["♂","♀"],
                        isRadio: true,
                        onSelected: (text,index,isSelected){
                            gender = index;
                            //print(index);
                        },
                        options: GroupButtonOptions(
                          spacing: 10,
                          borderRadius: BorderRadius.circular(10),
                          unselectedTextStyle: TextStyle(
                            fontSize: 20,
                            color: AppColor.textColor
                          ),
                          unselectedColor: HexColor("#ECF2FE"),
                          selectedTextStyle: TextStyle(
                              fontSize: 20,
                              color: AppColor.textColor
                          ),
                          selectedColor: HexColor("#686FA3"),
                        ),


                    ),
                    SizedBox(height: 60,),
                    Form(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("Weight (kg)"),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width/2,
                                child:TextFormField(
                                  controller: weightController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Weight",
                                    labelStyle: TextStyle(
                                      color: HexColor("#686FA3"),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: HexColor("#686FA3"),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:  HexColor("#686FA3")),
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Enter weight",
                                    border:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Height (cm)"),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width/2,
                                child:TextFormField(
                                  controller: heightController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Height",
                                    labelStyle: TextStyle(
                                      color: HexColor("#686FA3"),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: HexColor("#686FA3"),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:  HexColor("#686FA3")),
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Enter height",
                                    border:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40,),

                    Text("BMI = $bodyMassIndex kg/m\u00B2",style: GoogleFonts.roboto(
                      color: AppColor.textColor,
                      fontSize: 24,
                    ),),

                    Text(bodyMassIndexRange,style: GoogleFonts.roboto(
                      color: changeColor,
                      fontSize: 24,
                    ),),
                    SizedBox(height: 20,),
                    Text("Ideal Body Weight: $idealBodyWeight kg",style: GoogleFonts.roboto(
                      color: AppColor.textColor,
                      fontSize: 24,
                    ),),
                    SizedBox(height: 200,),

                    Container(
                      alignment: Alignment.bottomCenter,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200,35),
                          primary: AppColor.btnColor,

                        ),
                        onPressed: (){
                          setState(() {
                            bodyMassIndex = result.bmiCalculate(weightController, heightController).round().toInt();
                            idealBodyWeight = result.idealBodyWeight(heightController,gender).round().toInt();
                            if(bodyMassIndex < 18){
                              changeColor = Colors.red;
                              bodyMassIndexRange = "Underweight";
                            }
                            else if(bodyMassIndex >= 18.5 && bodyMassIndex <=25){
                              changeColor = Colors.green;
                              bodyMassIndexRange = "Normal";
                            }
                            else if(bodyMassIndex > 25 &&  bodyMassIndex <=30){
                              changeColor = Colors.amber;
                              bodyMassIndexRange = "Overweight";
                            }
                            else{
                              changeColor = Colors.red;
                              bodyMassIndexRange = "Obesity";
                            }
                          });
                        },
                        child: Text("Calculate"),

                      ) ,

                    )


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

double _bmiCalculate(TextEditingController weightController, TextEditingController heightController) {
  double result;
  double height = double.parse(heightController.text);
  double weight = double.parse(weightController.text);

  result = weight / (((height*height)/10000));

  return result;

}
double _idealBodyWeight(TextEditingController heightController, int gender) {
  late double result;
  double height = double.parse(heightController.text);

  if(gender == 0){
    result = 50 + (0.91 * (height-152.4));
  }
  else if(gender == 1){
    result = 45.5 + (0.91 * (height-152.4));
  }

  return result;
}