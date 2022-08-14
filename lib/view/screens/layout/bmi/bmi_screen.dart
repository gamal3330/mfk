import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfk/components/utils.dart';
import 'package:mfk/view/screens/layout/bmi/result_bmi_screen.dart';
import 'package:mfk/view/screens/layout/cubit/cubit.dart';
import 'package:mfk/view/screens/layout/cubit/states.dart';

import '../../../../components/constants.dart';
import '../../../widgets/age_selector.dart';
import '../../../widgets/height_selector.dart';
import '../../../widgets/weight_selector.dart';

// class BMIScreen extends StatefulWidget {
//   @override
//   State<BMIScreen> createState() => _BMIScreenState();
// }
//
// class _BMIScreenState extends State<BMIScreen> {
//   double height = 0.0;
//   double weight = 0.0 ;
//   bool labelShowVisibleForCm = false;
//   bool labelShowVisibleForKg = false;
//   double activeGenderButtonMale = 0.5 ;
//   double activeGenderButtonFemale = 0.5 ;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bGColorLight,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'حساب مؤشر الكتلة',
//                   style: TextStyle(
//                     fontFamily: 'Janna',
//                     fontSize: 37,
//                     color: const Color(0xff000000),
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.center,
//                   softWrap: false,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'الجنس',
//                   style: TextStyle(
//                     fontFamily: 'Janna',
//                     fontSize: 28,
//                     color: const Color(0xff000000),
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.center,
//                   softWrap: false,
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 24),
//                         decoration: BoxDecoration(
//                           color: HexColor('#2878D4').withOpacity(activeGenderButtonMale),
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: Text(
//                           'ذكر',
//                           style: TextStyle(
//                             fontFamily: 'Janna',
//                             fontSize: 24,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           textAlign: TextAlign.right,
//                           softWrap: false,
//                         ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           activeGenderButtonMale = 1 ;
//                           activeGenderButtonFemale = 0.5;
//                         });
//
//                       },
//                     ),
//                     InkWell(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 24),
//                         decoration: BoxDecoration(
//                           color: HexColor('#D4287E').withOpacity(activeGenderButtonFemale),
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: Text(
//                           'أنثى',
//                           style: TextStyle(
//                             fontFamily: 'Janna',
//                             fontSize: 24,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           textAlign: TextAlign.right,
//                           softWrap: false,
//                         ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           activeGenderButtonFemale = 1 ;
//                           activeGenderButtonMale = 0.5;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//
//                 Text(
//                   'الطول',
//                   style: TextStyle(
//                     fontFamily: 'Janna LT',
//                     fontSize: 28,
//                     color: const Color(0xff000000),
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.center,
//                   softWrap: false,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Visibility(
//                   visible: labelShowVisibleForCm,
//                   child: Text(
//                     '${height.round()}cm',
//                     style: TextStyle(
//                       fontFamily: 'Janna LT',
//                       fontSize: 28,
//                       color: const Color(0xff000000),
//                       fontWeight: FontWeight.w700,
//                     ),
//                     textAlign: TextAlign.center,
//                     softWrap: false,
//                   ),
//                 ),
//                 Slider(
//                   value: height,
//                   onChanged: (value)
//                   {
//                     setState(() {
//                       height = value;
//                       height > 1 ? labelShowVisibleForCm =true : false;
//
//                     });
//                   },
//                   min: 0,
//                   max: 220,
//
//                   activeColor: HexColor('#3F3D56'),
//                   inactiveColor: HexColor('#3F3D56').withOpacity(0.5),
//
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'الوزن',
//                   style: TextStyle(
//                     fontFamily: 'Janna LT',
//                     fontSize: 28,
//                     color: const Color(0xff000000),
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.center,
//                   softWrap: false,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Visibility(
//                   visible: labelShowVisibleForKg,
//                   child: Text(
//                     '${weight.round()}kg',
//                     style: TextStyle(
//                       fontFamily: 'Janna LT',
//                       fontSize: 28,
//                       color: const Color(0xff000000),
//                       fontWeight: FontWeight.w700,
//                     ),
//                     textAlign: TextAlign.center,
//                     softWrap: false,
//                   ),
//                 ),
//                 Slider(
//                   value: weight,
//                   onChanged: (value)
//                   {
//                     setState(() {
//                       weight = value;
//                       weight > 1 ? labelShowVisibleForKg =true : false;
//
//                     });
//                   },
//                   min: 0,
//                   max: 220,
//
//                   activeColor: HexColor('#3F3D56'),
//                   inactiveColor: HexColor('#3F3D56').withOpacity(0.5),
//
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '22.6',
//                         style: TextStyle(
//                           fontFamily: 'Janna',
//                           fontSize: 32,
//                           color: const Color(0xff000000),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.center,
//                         softWrap: false,
//                       ),
//                     ),
//                     Text(
//                       ': مؤشر كتلة الجسم الخاص بك هو',
//                       style: TextStyle(
//                         fontFamily: 'Janna ',
//                         fontSize: 24,
//                         color: const Color(0xff000000),
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.right,
//                       softWrap: false,
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 Text(
//                   'لديك جسم طبيعي .. عمل ممتاز',
//                   style: TextStyle(
//                     fontFamily: 'Janna',
//                     fontSize: 24,
//                     color: const Color(0xff000000),
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.center,
//                   softWrap: false,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: bGColorLight,
          appBar: AppBar(
            title: const Text(
              "حساب مؤشر الكتلة",
              style: TextStyle(fontFamily: 'Janna', fontSize: 32),
            ),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            backgroundColor: bGColorLight,
            elevation: 0.0,
            centerTitle: true,
            toolbarHeight: 75,
          ),
          body: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AgeSelector(),
                  WeightSelector(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  HeightSelector(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              buildButton(
                  context: context,
                  function: () {
                    cubit.saveNewBmi();
                    if (state is! LayOutSaveNewBmiLoading)
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return const ResultScreen();
                          },
                        ),
                      );
                    else
                    {
                      Center(child: CircularProgressIndicator(color: bGColorDark,),);
                    }
                  },
                  text: 'حساب'),
            ],
          ),
        );
      },
    );
  }
}
