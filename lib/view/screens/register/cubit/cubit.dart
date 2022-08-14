import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mfk/models/user_model.dart';
import 'package:mfk/view/screens/layout/cubit/cubit.dart';
import 'package:mfk/view/screens/register/cubit/state.dart';

import '../../../../components/navigators.dart';
import '../../../../helpers/local.dart';
import '../../layout/layout_screen.dart';

class MFKRegisterCubit extends Cubit<MFKRegisterStates> {
  MFKRegisterCubit() : super(MFKRegisterInitialState());

  static MFKRegisterCubit get(context) => BlocProvider.of(context);

  void signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required BuildContext context,
  }) async {
    emit(MFKRegisterLoadingState());
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CacheHelper.saveData(
        key: 'uId',
        value: value.user?.uid,
      );
      navigateAndDelete(context, const LayoutScreen());
      Fluttertoast.showToast(
          msg: ' تم تسجيل الدخول بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
      createUser(
          email: email, uId: value.user?.uid ?? ' ', name: name, phone: phone);
      LayoutCubit.get(context).getUserName();
      emit(MFKRegisterSuccesState());
    }).catchError((e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'The password provided is too weak.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      emit(MFKRegisterErrorState());
    });
  }

  void createUser({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) {
    emit(MFKCreateUserLoadingState());
    UserModel model = UserModel(
      uId: uId,
      name: name,
      email: email,
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(MFKCreateUserSuccesState());
    }).catchError((e) {
      emit(MFKCreateUserErrorState());
    });
  }
}
