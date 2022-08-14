import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mfk/view/screens/login/cubit/state.dart';
import '../../../../components/navigators.dart';
import '../../../../helpers/local.dart';
import '../../../../models/user_model.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/layout_screen.dart';

class MFKLoginCubit extends Cubit<MFKLoginStates> {
  MFKLoginCubit() : super(MFKLoginInitialState());

  static MFKLoginCubit get(context) => BlocProvider.of(context);

  late UserModel model;

  Future<UserCredential> signInWithGoogle(
      {required BuildContext context}) async {
    emit(MFKLoginLoadingState());
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn().then((value) {
      createUserForGmail(
        uId: value?.id ?? '',
        name: value?.displayName ?? '',
        email: value?.email ?? '',
      );
      CacheHelper.saveData(
        key: 'uId',
        value: value?.id,
      );
      print('----------');
      print(CacheHelper.getData(key: 'uId'));
      print('----------');

      navigateAndDelete(context, const LayoutScreen());
      Fluttertoast.showToast(
          msg: ' تم تسجيل الدخول بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
      LayoutCubit.get(context).getUserName();
      emit(MFKLoginSuccesState());
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: ' تعذر تسجيل الدخول',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(MFKLoginErrorState());
    });

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<UserCredential> signInWithFacebook(
  //     {required BuildContext context}) async {
  //   // Trigger the sign-in flow
  //   final LoginResult? loginResult =
  //       await FacebookAuth.instance.login().then((value) {
  //     if (value.accessToken!.token.isNotEmpty) {
  //       navigateAndDelete(context, const LayoutScreen());
  //       Fluttertoast.showToast(
  //           msg: ' تم تسجيل الدخول بنجاح',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.black54,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   }).catchError((e) {
  //     Fluttertoast.showToast(
  //         msg: ' تعذر تسجيل الدخول',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black54,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     print('------------');
  //     print(e.toString());
  //     print('------------');
  //   });
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult!.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  void singIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(MFKLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(
        key: 'uId',
        value: value.user?.uid,
      );
      print('----------');
      print(CacheHelper.getData(key: 'uId'));
      print('----------');

      navigateAndDelete(context, const LayoutScreen());
      Fluttertoast.showToast(
          msg: 'تم تسجيل الدخول بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
      LayoutCubit.get(context).getUserName();
      emit(MFKLoginSuccesState());
    }).catchError((e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'لم يتم العثور على هذا البريد.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'كلمة السر خاطئة.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      emit(MFKLoginErrorState());
    });
  }

  void createUserForGmail({
    required String email,
    required String uId,
    required String name,
  }) {
    UserModel model = UserModel(
      uId: uId,
      name: name,
      email: email,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
    }).catchError((e) {
    });
  }







}
