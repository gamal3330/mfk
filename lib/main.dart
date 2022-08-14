import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfk/view/screens/layout/cubit/cubit.dart';
import 'package:mfk/view/screens/layout/layout_screen.dart';
import 'package:mfk/view/screens/login/login_screen.dart';
import 'package:mfk/view/screens/welcome/onboarding_screen.dart';
import 'package:mfk/view/screens/welcome/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'components/blocobserver.dart';
import 'components/constants.dart';
import 'cubit/cubit.dart';
import 'helpers/local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp()
      .then((value) => debugPrint('Initialed'))
      .catchError((e) => debugPrint('Error is $e'));
  bool? onBoarding = CacheHelper.getData(key: 'OnBoarding');
  uId = CacheHelper.getData(key: 'uId');
  print(uId);
  if (onBoarding != null) {
    MyApp.widget = LoginScreen();
     if  (uId != null) {
      MyApp.widget = const LayoutScreen();
    }

  } else {
    MyApp.widget = OnBoarding();
  }
  BlocOverrides.runZoned(
        () {
          runApp(MyApp());    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  static late Widget widget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MFKCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit()..getUserName(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Splash(),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: Duration(milliseconds: 500),
          duration: 3000,
          pageTransitionType: PageTransitionType.rightToLeft,
          nextScreen: widget,
        ),
        theme: ThemeData(
          appBarTheme:
              AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
        ),
      ),
    );
  }
}
