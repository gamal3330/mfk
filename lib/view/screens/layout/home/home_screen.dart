import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfk/components/navigators.dart';
import 'package:mfk/view/screens/layout/cubit/cubit.dart';
import 'package:mfk/view/screens/layout/cubit/states.dart';
import '../../../../components/constants.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state)
      {

      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: bGColorLight,
          appBar: AppBar(
            backgroundColor: bGColorLight,
            elevation: 0.0,
            title: const Text(
              'الرئيسية',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Janna',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async  {
                  cubit.signOut( context: context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
              IconButton(icon: Icon(Icons.person_outline_outlined , color: Colors.black,), onPressed: ()
              {
                navigateTo(context, ProfileScreen());
              },),
            ],
          ),
          body: ConditionalBuilder(
            condition: cubit.model != null,
            builder: (context)=>SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: const Color(0x2eb34b4d),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Text(
                              'عرض الكل',
                              style: TextStyle(
                                fontFamily: 'Janna',
                                fontSize: 18,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                          ),
                          onTap: () {
                            print('ssss');
                          },
                        ),
                        const Text(
                          'المراكز',
                          style: TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 22,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Container(
                          width: 16,
                        ),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('image/kidny.png'),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Text(
                                      'مستشفى عدن الدولي',
                                      style: TextStyle(
                                        fontFamily: 'Janna',
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x80b34b4d),
                              borderRadius: BorderRadius.circular(22.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: const Color(0x3392ccff).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'عرض الكل',
                              style: TextStyle(
                                fontFamily: 'Janna',
                                fontSize: 18,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                          ),
                          onTap: () {
                            print('ssss');
                          },
                        ),
                        Text(
                          'الوجبات',
                          style: TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 22,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Container(
                          width: 16,
                        ),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'image/meal.png',
                                            fit: BoxFit.contain,
                                            width: 125,
                                            height: 125,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0x3392ccff).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(22.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff707070)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context)=> Center(child: CircularProgressIndicator(color: bGColorDark,),),
          )
        );
      },
    );
  }
}
