import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildButton(
        {required BuildContext context,
        required VoidCallback function,
        required String text}) =>
    Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(width: 1.0, color: const Color(0xff707070)),
      ),
      width: MediaQuery.of(context).size.width - 150,
      height: MediaQuery.of(context).size.height / 12,
      child: SizedBox.expand(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor('#3F3D56'),
            ),
            onPressed: function,
            child: Text(
              '${text}',
              style: TextStyle(
                fontFamily: 'Janna',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

Widget buildTextFormField({
  IconData? icon,
  required String label,
  required bool obscure,
  TextEditingController? controller,
  required FormFieldValidator validate,
  Widget? suffix,
  Color? iconColor
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(

        iconColor: iconColor,
        border: const OutlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Icon(
            icon,
            size: 32,
          ),
        ),
        suffixIcon: suffix,
        label: Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text(
            label,
            style: TextStyle(
                fontFamily: 'Janna', color: Colors.black54, fontSize: 18),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
                width: 2,
                color: HexColor('#7383BF'),
                style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
                width: 2,
                color: HexColor('#7383BF'),
                style: BorderStyle.solid)),
      ),
    );
