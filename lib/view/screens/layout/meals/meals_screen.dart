import 'package:flutter/material.dart';

import '../../../../components/constants.dart';

class MealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الوجبات',
                  style: TextStyle(
                    fontFamily: 'Janna',
                    fontSize: 36,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, i) {
                      return Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0x8092ccff),
                              borderRadius: BorderRadius.circular(28.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      'image/meal1.png',
                                      fit: BoxFit.contain,
                                      width: 58,
                                      height: 58,
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                Text(
                                  'دجاج مشوي وبطاطس صحية',
                                  style: TextStyle(
                                    fontFamily: 'Janna',
                                    fontSize: 20,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  softWrap: false,
                                )
                              ],
                            ),
                          ));
                    },
                    itemCount: 14,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
