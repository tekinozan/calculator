
import 'package:flutter/cupertino.dart';

class Results{
  double bmiCalculate(TextEditingController weightController, TextEditingController heightController) {
    double result;
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    result = weight / (((height*height)/10000));

    return result;

  }
  double idealBodyWeight(TextEditingController heightController, int gender) {
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
}

class Conversions{
  String celcius(double temp){
    String celciusToF = ((temp * 9/5) + 32).round().toString();
    String celciusToKelv = ((temp + 273.5)).round().toString();
    String result = "Fahrenheit: $celciusToF℉  \nKelvin: $celciusToKelv K";
    return result;
  }
  String fahrenheit(double temp){
    String fahrenheitToC = ((temp - 32) * (9/5)).round().toString();
    String fahrenheitToKelv = ((temp + 459) * (5/9)).round().toString();
    String result = "Celcius: $fahrenheitToC℃ \nKelvin: $fahrenheitToKelv K";
    return result;
  }
}