import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/colors.dart';

class WeightCalculator extends StatefulWidget {
  const WeightCalculator({Key? key}) : super(key: key);

  @override
  State<WeightCalculator> createState() => _WeightCalculatorState();
}
final List<String> _mesaures = [
  'Grams',
  'Kilograms',
  'Pounds',
  'Ounces'
];

late double _value;
String _fromMesaures = 'Grams';
String _toMesaures = 'Kilograms';
String _results = "";

final Map<String, int> _mesauresMap = {
  'Grams': 0,
  'Kilograms': 1,
  'Pounds': 2,
  'Ounces': 3,
};

dynamic _formulas = {
  '0': [1, 0.001, 0.00220462, 0.035274],
  '1': [1000, 1, 2.20462, 35.274],
  '2': [453.592, 0.453592, 1, 16],
  '3': [28.3495, 0.0283495, 3.28084, 0.0625, 1],
};

class _WeightCalculatorState extends State<WeightCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        padding: EdgeInsets.only(right: 15,left: 15),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 160,),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor("#686FA3"),
                      width: 2,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color:  HexColor("#686FA3"),
                  ) ,
                  labelText: 'Enter the Value',
                ),
                onChanged: (value) {
                  setState(() {
                    _value = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      DropdownButton(
                        dropdownColor: HexColor("#ECF2FE"),
                        iconSize: 0,
                        underline: Container(
                          height: 1.0,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.red, width: 1.0))
                          ),),
                        items: _mesaures
                            .map((String value) => DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _fromMesaures = value!;
                          });
                        },
                        value: _fromMesaures,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('To',
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                      DropdownButton(
                        dropdownColor: HexColor("#ECF2FE"),
                        iconSize: 0,
                        underline: Container(
                          height: 1.0,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.red, width: 1.0))
                          ),),
                        items: _mesaures
                            .map((String value) => DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _toMesaures = value!;
                          });
                        },
                        value: _toMesaures,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: _convert,
                child: Text(
                  'Convert',
                  style: TextStyle(color: AppColor.btnColorText,fontSize: 16),
                ),
                color: AppColor.btnColor,
              ),
              SizedBox(height: 25.0),
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
    );
  }
  void _convert() {

    if (_value != 0 && _fromMesaures.isNotEmpty && _toMesaures.isNotEmpty) {
      int? from = _mesauresMap[_fromMesaures];
      int? to = _mesauresMap[_toMesaures];

      var multiplier = _formulas[from.toString()][to];

      setState(() {
        _results = "$_value $_fromMesaures = ${_value * multiplier} $_toMesaures";
      });
    } else {
      setState(() {
        _results = "Please enter a non zero value";
      });
    }
  }
}