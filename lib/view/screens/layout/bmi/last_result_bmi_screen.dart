import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mfk/components/constants.dart';

class LastResult extends StatelessWidget {
  const LastResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColorLight,
      appBar: AppBar(
        title: Text(
          'مؤشرات BMI',
          style:
              TextStyle(fontSize: 24, fontFamily: 'Janna', color: Colors.black),
        ),
        backgroundColor: bGColorLight,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.black,
                );
              },
              itemCount: 20,
              separatorBuilder: (context, i) => Divider(),
            ),
          )
        ],
      ),
    );
  }
}
