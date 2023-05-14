import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget
{
  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  bool? isObsecre = true;
  bool? enabled = true;

  CustomTextField({
    this.controller,
    this.data,
    this.hintText,
    this.isObsecre,
    this.enabled,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfff9fcfd),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        obscureText: isObsecre!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: Colors.white,
                child: Icon(
                  data,
                  color:Colors.black,
                ),
              ),
            ),
          ),

          focusColor: Theme.of(context).primaryColor,

          hintText: hintText,hintStyle:TextStyle() ,
        ),
      ),
    );

  }
}



