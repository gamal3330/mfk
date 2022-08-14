import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfk/models/user_model.dart';
import 'package:mfk/view/screens/layout/cubit/states.dart';

import '../../../../helpers/local.dart';
import '../../login/login_screen.dart';
import '../bmi/bmi_screen.dart';
import '../centers/centers_screen.dart';
import '../home/home_screen.dart';
import '../meals/meals_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  void signOut({
    required context,
  }) {
    CacheHelper.clearData(key: 'uId').then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
      }
    });
  }

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    HomeScreen(),
    BMIScreen(),
    CentersScreen(),
    MealsScreen(),
  ];

  changeBottom(int Index) {
    currentIndex = Index;
    emit(NavBarState());
  }

  UserModel? model;

  void getUserName() {
    emit(LayoutGetUserLoadingData());
    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
      model = UserModel.fromJson(value.data());
      print('------');
      print(value.data());
      print('------');
      emit(LayoutGetUserSuccesData());
    }).catchError((e) {
      print('------ERRRRRR');
      print(e.toString());
      print('------');
      emit(LayoutGetUserErrorData());
    });
  }

  List bmis = [11,2,123,12,312,3,];

  void saveNewBmi() async{
    emit(LayOutSaveNewBmiLoading());
    await FirebaseFirestore.instance.collection('users').add({
      'bmi' : bmis[0]
    }).then((value)
    {
      emit(LayOutSaveNewBmiScces());
    }).catchError((e){
      print('error is ${e.toString()}');
      emit(LayOutSaveNewBmiError());
    });
  }
}
