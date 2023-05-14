import 'package:flutter/material.dart';
import 'package:users_app/mainScreens/menus_screen.dart';
import 'package:users_app/models/sellers.dart';


class SellersDesignWidget extends StatefulWidget
{
  Sellers? model;
  BuildContext? context;

  SellersDesignWidget({this.model, this.context});

  @override
  _SellersDesignWidgetState createState() => _SellersDesignWidgetState();
}



class _SellersDesignWidgetState extends State<SellersDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MenusScreen(model: widget.model)));
      },
      splashColor:Color(0xffebf0f6),
      child: Padding(
        padding: const EdgeInsets.all(12),
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
                    widget.model!.sellerAvatarUrl!,
                    height: 220.0,
                  fit: BoxFit.cover,
                  width: 400,
                ),
              ),
              const SizedBox(height: 5.0,),
              Text(
                widget.model!.sellerName!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Clash",
                ),
              ),
              const SizedBox(height: 5.0,),
              Text(
                widget.model!.sellerEmail!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              // const SizedBox(height: 4.0,),

            ],
          ),
        ),
      ),
    );
  }
}
