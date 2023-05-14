import 'package:flutter/material.dart';
import 'package:users_app/mainScreens/items_screen.dart';
import 'package:users_app/models/menus.dart';
import 'package:users_app/models/sellers.dart';


class MenusDesignWidget extends StatefulWidget
{
  Menus? model;
  BuildContext? context;

  MenusDesignWidget({this.model, this.context});

  @override
  _MenusDesignWidgetState createState() => _MenusDesignWidgetState();
}



class _MenusDesignWidgetState extends State<MenusDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsScreen(model: widget.model)));
      },
      splashColor: Color(0xffebf0f6),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius:6.0,
                spreadRadius: 4.0,
                offset: Offset(0.0, 0.0),
              )
            ],
          ),
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                child: Image.network(
                  widget.model!.thumbnailUrl!,
                  height: 200.0,
                  fit: BoxFit.cover,
                  width: 400,
                ),
              ),
              const SizedBox(height: 20.0,),
              Text(
                widget.model!.menuTitle!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Inter",
                ),
              ),
              Text(
                widget.model!.menuInfo!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5.0,),

            ],
          ),
        ),
      ),
    );
  }
}
