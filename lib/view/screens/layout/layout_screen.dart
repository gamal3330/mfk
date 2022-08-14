import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) => LayoutCubit(),
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: cubit.currentIndex,
            iconSize: 28.0,
            backgroundColor: HexColor('#3F3D56'),
            borderRadius: Radius.circular(6),
            selectedColor: Colors.white,
            strokeColor: Color(0x30040307),
            unSelectedColor:Colors.grey.shade900,
            items: [
              CustomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('الرئيسية',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Janna',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.broken_image),
                title: Text('BMI',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Janna',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.location_city_rounded),
                title: Text(
                  'المراكز',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Janna',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.set_meal),
                title: Text('الوجبات',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Janna',
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )),
              ),


            ],
            onTap: (index) {
              cubit.changeBottom(index);
            },
          ),
        );
      },
    );
  }
}



