import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:calculator_app/utils/colors.dart';
import 'pages/binaryCalculatorPage.dart';
import 'pages/bmiCalculatorPage.dart';
import 'pages/gradeCalcPage.dart';
import 'pages/lenghtCalcPage.dart';
import 'pages/tempCalcPage.dart';
import 'pages/weightCalcPage.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
Ink tapContainer(String img, String title){
  return Ink(
    decoration: BoxDecoration(color: AppColor.containerColor,borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(img,width: 54,),
        SizedBox(height: 14,),
        Text(title,style:GoogleFonts.inter(
          color: AppColor.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ) ,)
      ],
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            SizedBox(height: 100,),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome",style: GoogleFonts.roboto(
                    fontSize: 28,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            Divider(color: HexColor("#F85C53"),thickness: 2, indent: 16, endIndent: 200,),

            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 18,
                    mainAxisSpacing: 18,childAspectRatio: 1.0),
                    children: [
                      InkWell(
                          highlightColor: HexColor("#686FA3"),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LenghtCalculator(),),);
                          },
                          child: tapContainer("images/measuring-tape.png","Lenght Conversion")),
                      InkWell(
                          highlightColor: HexColor("#686FA3"),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> WeightCalculator(),),);
                          },
                          child: tapContainer("images/weighing-machine.png","Weight Conversion")),
                      InkWell(
                          highlightColor: HexColor("#686FA3"),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TemperatureCalculator(),),);
                          },
                          child:tapContainer("images/hot.png","Temperature\n  Conversion")),
                      InkWell(
                          highlightColor: HexColor("#686FA3"),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> BmiCalculator(),),);
                        },
                          child: tapContainer("images/bmi.png","BMI Calculator")),
                      InkWell(
                          highlightColor: HexColor("#686FA3"),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> BinaryCalculator(),),);
                          },
                          child:tapContainer("images/binary-code.png","Binary Calculator")),
                      InkWell(
                          highlightColor: HexColor("#686FA3"),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> GradeCalculator(),),);
                          },
                          child:tapContainer("images/score.png","Grade Calculator")),
                    ],

                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}

