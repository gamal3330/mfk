
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mfk/components/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../components/utils.dart';
import '../../../helpers/local.dart';
import '../login/login_screen.dart';

class OnBoardingModel {
  final String title, body, image;

  OnBoardingModel(
      {required this.title, required this.body, required this.image});
}

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override


  void submit() {
    CacheHelper.saveData(key: 'OnBoarding', value: true).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ),
          (route) => false);
    });
  }

  var controller = PageController();

  bool isLast = false;

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      title: 'مرحباً',
      body:
          ' تطبيق مرضى الفشل الكلوي يساعدك\nعلى معرفة مواقع غسيل الكلى والتواصل\nمعهم ',
      image: 'image/1.svg',
    ),
    OnBoardingModel(
      title: 'الوجبات الصحية',
      body:
          'يُمَّكنك هذا التطبيق من اختيار الوجبات \nالمناسبة من أجل الحفاظ على صحتك',
      image: 'image/2.svg',
    ),
    OnBoardingModel(
      title: 'مؤشر كتلة الجسم',
      body: 'بالإضافة الى حساب مؤشر كتلة الجسم  ',
      image: 'image/3.svg',
    ),
  ];

  bool skipButton = true;



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: bGColorLight,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      submit();
                    },
                    child: Visibility(
                      visible: skipButton,
                      child: Text(
                        'تخطي',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Janna",
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                if (value == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                    skipButton = false;
                  });
                } else
                  setState(() {
                    isLast = false;
                    skipButton = true;
                  });
              },
              physics: BouncingScrollPhysics(),
              controller: controller,
              itemBuilder: (context, index) {
                return buildItemOnBoarding(context, boarding[index]);
              },
              itemCount: boarding.length,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: boarding.length,
            effect: ExpandingDotsEffect(
              activeDotColor: bGColorDark,
              dotColor: Colors.grey.shade100,
              expansionFactor: 4,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: buildButton(
                text: 'التالي',
                context: context,
                function: () {
                  if (isLast) {
                    submit();
                  } else
                    controller.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn);
                }),
          ),
        ],
      ),
    );
  }

  Widget buildItemOnBoarding(
    BuildContext context,
    OnBoardingModel model,
  ) =>
      Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                model.title,
                style: TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 40,
                  color: const Color(0xe5363232),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                model.body,
                style: TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 22,
                  color: Color(0xff363232),
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textAlign: TextAlign.right,
                softWrap: false,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: SvgPicture.asset(
                  '${model.image}',
                ),
              ),
            ),
          ],
        ),
      );
}
