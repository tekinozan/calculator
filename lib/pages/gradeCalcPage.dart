import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:calculator_app/utils/colors.dart';

class GradeCalculator extends StatefulWidget {
  const GradeCalculator({Key? key}) : super(key: key);

  @override
  State<GradeCalculator> createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {

  final midtermController = TextEditingController();
  final midtermPercentConroller = TextEditingController();

  final finalController = TextEditingController();
  final finalPercentConroller = TextEditingController();

  String _results = "";

  final TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );


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
                    Form(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("Midterm", style: textStyle,),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 2,
                                  child: textForm(midtermController, "Midterm",
                                      "Enter number")
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("%", style: textStyle,),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 5,
                                  child: textForm(
                                      midtermPercentConroller, "%", "%40")
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Form(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("Final", style: textStyle,),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 2,
                                  child: textForm(
                                      finalController, "Final", "Enter number")
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("%", style: textStyle,),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 5,
                                  child: textForm(
                                      finalPercentConroller, "%", "%60")
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 35),
                          primary: HexColor("#F85C53"),

                        ),
                        onPressed: (){
                          setState(() {
                            _results = "${calculateGrade(midtermController, midtermPercentConroller, finalController, finalPercentConroller).round().toInt()}";
                          });
                        },
                        child: Text("Calculate"),
                      ),

                    ),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor("#ECF2FE"),
                      ),
                      child: Center(
                        child: Text(
                          "Your Grade is $_results",
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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

  double calculateGrade(TextEditingController midtermConroller,
      TextEditingController midtermPercConroller, TextEditingController finalExController,
      TextEditingController finalpPercConroller)
  {
    int midterm = int.parse(midtermConroller.text);
    int midtermPerc = int.parse(midtermPercConroller.text);
    int finalEx = int.parse(finalExController.text);
    int finalExPrc = int.parse(finalpPercConroller.text);

    double calculateGrade = ((midterm * midtermPerc)/100) + ((finalEx * finalExPrc)/100) ;
    return calculateGrade;
   }

  TextFormField textForm(TextEditingController controller, String labeltext,
      String hintText) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labeltext,
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
            borderSide: BorderSide(
                color: HexColor("#686FA3")),
            borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}