import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:calculator_app/utils/colors.dart';

class BinaryCalculator extends StatefulWidget {
  const BinaryCalculator({Key? key}) : super(key: key);

  @override
  State<BinaryCalculator> createState() => _BinaryCalculatorState();
}
final List<String> _mesaures = [
  '+',
  '-',
  'x',
];

String operator = '+';

String _results = "";

TextEditingController valueController = TextEditingController();
TextEditingController value2Controller = TextEditingController();


class _BinaryCalculatorState extends State<BinaryCalculator> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 15, left: 15),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 80,),
                TextField(
                  controller: valueController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("#686FA3"),
                        width: 2,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: HexColor("#686FA3"),
                    ),
                    labelText: 'Enter only 1 or 0',
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  width: 80,
                  child: DropdownButton(
                    isExpanded: true,
                    iconSize: 0,
                    dropdownColor: HexColor("#ECF2FE"),
                    underline: Container(
                      height: 1.0,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.red, width: 1.0))
                      ),),
                    items: _mesaures
                        .map((String value) =>
                        DropdownMenuItem<String>(
                          child: Center(child: Text(value)),
                          value: value,
                        ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        operator = value!;
                      });
                    },
                    value: operator,
                  ),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: value2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("#686FA3"),
                        width: 2,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: HexColor("#686FA3"),
                    ),
                    labelText: 'Enter only 1 or 0',
                  ),
                ),
                SizedBox(height: 40,),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: _calculate,
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        color: AppColor.btnColorText, fontSize: 16),
                  ),
                  color: AppColor.btnColor,
                ),
                SizedBox(height: 40.0),
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 4,
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
                      _results,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculate() {
    String value = (valueController.text.toString());
    String value2 = (value2Controller.text.toString());
    int convertNum = int.parse(value, radix: 2);
    int convertNum2 = int.parse(value2, radix: 2);

    if (value.isNotEmpty && value2.isNotEmpty && operator.isNotEmpty) {
      if (operator == '+') {
        setState(() {
          var result = convertNum + convertNum2;
          _results = "Binary Value:\n$value $operator $value2 = ${result.toRadixString(2)}\n\nDecimal Value:\n $convertNum $operator $convertNum2 = $result";
        });
      }
      if (operator == '-') {
        setState(() {
          var result = convertNum - convertNum2;
          _results = "Binary Value:\n$value $operator $value2 = ${result.toRadixString(2)}\n\nDecimal Value:\n $convertNum $operator $convertNum2 = $result";
        });
      }
      if (operator == 'x') {
        setState(() {
          var result = convertNum * convertNum2;
          _results = "Binary Value:\n$value $operator $value2 = ${result.toRadixString(2)}\n\nDecimal Value:\n $convertNum $operator $convertNum2 = $result";
        });
      }
    }
      else {
        setState(() {
          _results = "Please enter a non zero value";
        });
      }
    }
  }