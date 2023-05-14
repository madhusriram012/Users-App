import 'package:flutter/material.dart';
import 'package:users_app/global/global.dart';


class SimpleAppBar extends StatelessWidget with PreferredSizeWidget
{
  String? title;
  final PreferredSizeWidget? bottom;

  SimpleAppBar({this.bottom, this.title});

  @override
  Size get preferredSize => bottom==null?Size(56, AppBar().preferredSize.height):Size(56, 80+AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context)
  {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color(0xff464646),
        ),
      ),
      centerTitle: true,
      title: Text(
        sharedPreferences!.getString("title") ?? "",
        style: const TextStyle(fontSize: 45.0, letterSpacing: 3, color: Colors.white, fontFamily: "Signatra"),
      ),
    );
  }
}
