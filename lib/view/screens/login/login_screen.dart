import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mfk/helpers/local.dart';
import 'package:mfk/view/screens/layout/cubit/cubit.dart';
import 'package:mfk/view/screens/login/cubit/cubit.dart';
import 'package:mfk/view/screens/login/cubit/state.dart';

import '../../../components/constants.dart';
import '../../../components/navigators.dart';
import '../../../components/utils.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MFKLoginCubit(),
      child: BlocConsumer<MFKLoginCubit, MFKLoginStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = MFKLoginCubit.get(context);
          return Scaffold(
            backgroundColor: bGColorLight,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontFamily: 'Janna',
                              fontSize: 40,
                              color: Colors.black,
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
                        const SizedBox(
                          height: 38,
                        ),
                        buildTextFormField(
                            validate: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال البريد الإلكتروني';
                              } else if (!emailValid) {
                                return 'يرجى تسجيل البريد بشكل مناسب';
                              }
                              return null;
                            },
                            controller: email,
                            icon: (Icons.email),
                            label: 'البريد الإبكتروني',
                            obscure: false),
                        const SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            suffix: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_red_eye)),
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال كلمة السر ';
                              }
                              return null;
                            },
                            controller: password,
                            label: 'كلمة المرور',
                            icon: Icons.password_outlined,
                            obscure: true),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'هل نسيت كلمة السر ؟',
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                fontSize: 18,
                                fontFamily: 'Janna',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ConditionalBuilder(
                                condition: state is! MFKLoginLoadingState,
                                builder: (context) => buildButton(
                                    context: context,
                                    function: () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        cubit.singIn(
                                            email: email.text,
                                            password: password.text,
                                            context: context);
                                        LayoutCubit.get(context).getUserName();
                                      }
                                    },
                                    text: 'تسجيل الدخول'),
                                fallback: (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: bGColorDark,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 2,
                                color: HexColor('#7383BF'),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(14),
                              child: Text(
                                'أو',
                                style: TextStyle(
                                  fontFamily: 'Janna',
                                  fontSize: 18,
                                  color: Color(0xff363232),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.right,
                                softWrap: false,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 2,
                                color: HexColor('#7383BF'),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                await cubit.signInWithGoogle(context: context);
                              },
                              child: Image.asset(
                                'image/google.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            InkWell(
                              onTap: ()  {
                                LayoutCubit.get(context).getUserName();

                              },
                              child: Image.asset(
                                'image/facebook.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        InkWell(
                          onTap: () {
                            navigateAndDelete(context, RegisterScreen());
                          },
                          child: const Text(
                            'إنشاء حساب جديد',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                              fontFamily: 'Janna',
                              fontSize: 22,
                              color: const Color(0xff806e6e),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
