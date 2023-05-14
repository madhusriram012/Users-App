import 'package:flutter/material.dart';
import 'package:users_app/assistantMethods/cart_item_counter.dart';
import 'package:users_app/main.dart';
import 'package:provider/provider.dart';
import 'package:users_app/mainScreens/cart_screen.dart';


class MyAppBar extends StatefulWidget with PreferredSizeWidget
{
  final PreferredSizeWidget? bottom;
  final String? sellerUID;
  MyAppBar({this.bottom, this.sellerUID});


  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => bottom==null?Size(56, AppBar().preferredSize.height):Size(56, 80+AppBar().preferredSize.height);
}

class _MyAppBarState extends State<MyAppBar>
{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color(0xff464646),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: ()
        {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        "On Campus Delivery",
        style: TextStyle(fontSize: 20, fontFamily: "Inter"),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color:  Color(0xffc3b091),),
              onPressed: ()
              {
                //send user to cart screen
                Navigator.push(context, MaterialPageRoute(builder: (c)=> CartScreen(sellerUID: widget.sellerUID)));

              },
            ),
            Positioned(
              child: Stack(
                children: [
                  const Icon(
                    Icons.brightness_1,
                    size: 20.0,
                    color: Colors.red,
                  ),
                  Positioned(
                    top: 3,
                    right: 6,
                    child: Center(
                      child: Consumer<CartItemCounter>(
                        builder: (context, counter, c)
                        {
                          return Text(
                            counter.count.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
