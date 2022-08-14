import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mfk/view/screens/register/cubit/cubit.dart';
import 'package:mfk/view/screens/register/cubit/state.dart';

import '../../../../components/constants.dart';
import '../../../../components/navigators.dart';
import '../../../../components/utils.dart';
import '../layout/cubit/cubit.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MFKRegisterCubit(),
      child: BlocConsumer<MFKRegisterCubit, MFKRegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MFKRegisterCubit.get(context);
          return Scaffold(
            backgroundColor: bGColorLight,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'تسجيل حساب جديد',
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
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            controller: name,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى تعبئة الحقل';
                              } else if (value.length > 10) {
                                return 'الحد الأقصى للأسم هو 10 أحرف';
                              }
                              return null;
                            },
                            icon: (Icons.person),
                            label: 'الأسم',
                            obscure: false),
                        SizedBox(
                          height: 12,
                        ),
                        buildTextFormField(
                            validate: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (value == null || value.isEmpty) {
                                return 'يرجى تعبئة الحقل';
                              } else if (!emailValid) {
                                return 'يرجى تسجيل البريد بشكل مناسب';
                              }
                              return null;
                            },
                            controller: email,
                            label: 'البريد الإلكتروني',
                            obscure: false,
                            icon: (Icons.email)),
                        SizedBox(
                          height: 12,
                        ),
                        buildTextFormField(
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى تعبئة الحقل';
                              }

                              return null;
                            },
                            controller: password,
                            icon: (Icons.password),
                            label: 'كلمة المرور',
                            obscure: true),
                        SizedBox(
                          height: 12,
                        ),
                        buildTextFormField(
                            controller: phone,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى تعبئة الحقل';
                              }
                              return null;
                            },
                            label: 'رقم الهاتف',
                            obscure: false,
                            icon: (Icons.phone)),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ConditionalBuilder(
                                condition: state is! MFKRegisterLoadingState,
                                builder: (context) => buildButton(
                                    context: context,
                                    function: () {
                                      if (_formKey.currentState!.validate()) {
                                        cubit.signUp(
                                            name: name.text,
                                            email: email.text,
                                            password: password.text,
                                            phone: phone.text,
                                            context: context);
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        LayoutCubit.get(context).getUserName();
                                      }
                                    },
                                    text: 'تسجيل '),
                                fallback: (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: bGColorDark,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
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
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Text(
                                'أو',
                                style: TextStyle(
                                  fontFamily: 'Janna',
                                  fontSize: 18,
                                  color: const Color(0xff363232),
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
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                navigateTo(context, LoginScreen());
                              },
                              child: Text(
                                'تسحيل الدخول',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                    fontSize: 18,
                                    fontFamily: 'Janna',
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              'هل لديك حساب ؟',
                              style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  fontSize: 18,
                                  fontFamily: 'Janna',
                                  color: Colors.grey.shade500),
                            )
                          ],
                        )
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
