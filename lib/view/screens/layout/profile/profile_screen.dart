import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfk/components/constants.dart';
import 'package:mfk/view/screens/layout/cubit/cubit.dart';
import 'package:mfk/view/screens/layout/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: bGColorLight,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: bGColorLight,
            elevation: 0.0,
            title: const Text(
              'الملف الشخصي',
              style: TextStyle(fontFamily: 'Janna', color: Colors.black),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.model != null,
            builder: (context) => Column(
              children: [
                Container(
                  height: 250,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                          width: double.infinity,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 60),
                            child: Text('وَلَا تَيْأَسُوا مِن رَّوْحِ اللَّهِ',
                                style: TextStyle(
                                fontSize: 32, color: Colors.white, fontFamily: 'Majeed'),
                            textAlign: TextAlign.center,),
                          ),
                          decoration: BoxDecoration(
                            color: bGColorDark,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 64,
                        backgroundColor: bGColorLight,
                        child: CircleAvatar(
                          backgroundColor: bGColorLight,
                          radius: 58,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/orange-hat-cute-young-guy-orange-shirt-with-hat-praying-smiling_140725-163603.jpg?t=st=1657660020~exp=1657660620~hmac=f20c3011a2a145c8cf8b7d632e95f74e634659402a0dc1608ebe66c80702f8c7&w=1380',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('${cubit.model?.name}' , style: TextStyle(fontSize: 24 , color: Colors.black , fontFamily: 'Janna',),),
              ],
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: bGColorDark,
              ),
            ),
          ),
        );
      },
    );
  }
}
