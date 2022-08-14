import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mfk/components/constants.dart';
import 'package:mfk/components/navigators.dart';
import 'package:mfk/view/screens/layout/bmi/last_result_bmi_screen.dart';
import '../../../widgets/value_provider.dart';
import 'bmi_functions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int weight = ValueProvider().getWeight();
    int height = ValueProvider().getHeight();
    double bmi = findBMI(height, weight);
    var response = getResponse(bmi);
    return Scaffold(
      backgroundColor: bGColorLight,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            navigateTo(context, LastResult());
          }, icon: Icon(Icons.history),),
        ],
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: const Text("النتيجة" , style: TextStyle(fontFamily: 'Janna' , fontSize: 24), ) ,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        backgroundColor: bGColorLight,
        elevation: 0.0,
      ),
      body: Center(
          child: Container(
            // color: Colors.yellow,
            height: 500,
            width: 300,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0, // extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      bmi.toStringAsFixed(2).split(".")[0],
                      style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(85, 87, 105, 1)),
                    ),
                    Text(
                      "." + bmi.toStringAsFixed(2).split(".")[1],
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(85, 87, 105, 1)),
                    )
                  ]),
                  Text(
                    response,
                    style: TextStyle(
                      fontFamily: 'Janna',
                        color: bmi <= 18.8 ? Colors.red : bmi > 18.5 && bmi <= 24.9 ? Colors.green : bmi >= 25 && bmi <= 29.9 ? Colors.orangeAccent : Colors.red ,
                        fontWeight: FontWeight.w800,
                        fontSize: 25),
                  ),
                  const Text(
                    "نطاق مؤشر كتلة الجسم الطبيعي هو 18.5 kg/m\u00B2 - 24.9 kg/m\u00B2",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Janna',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(85, 87, 105, 1)),
                  ),

                ],
              ),
            ),
          )),
    );
  }
}