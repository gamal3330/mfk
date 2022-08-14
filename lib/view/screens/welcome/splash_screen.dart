import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGColorDark,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 314,
              height: 314,
              child: DropShadowImage(
                image: Image.asset(
                  'image/k.png',
                  fit: BoxFit.fill,
                ),
                offset: const Offset(0, 0.2),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: const Text(
                'مرضى الفشل الكلوي',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Janna',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                'وَإِذَا مَرِضْتُ فَهُوَ يَشْفِينِ',
                style: TextStyle(
                    fontSize: 22, color: Colors.white, fontFamily: 'Majeed'),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
