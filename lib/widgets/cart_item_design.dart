import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:users_app/models/items.dart';

class CartItemDesign extends StatefulWidget {
  final Items? model;
  BuildContext? context;
  final int? quanNumber;

  CartItemDesign({
    this.model,
    this.context,
    this.quanNumber,
  });

  @override
  _CartItemDesignState createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  TextEditingController counterTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xff464646),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              //image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                widget.model!.thumbnailUrl!,
                width: 120,
                height: 120,
                    fit: BoxFit.fill,
              )),

              const SizedBox(
                width: 60,
              ),



              //title
              //quantity number
              //price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  Text(
                    widget.model!.title!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Kiwi",
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),

                  //quantity number // x 7
                  Row(
                    children: [
                      const Text(
                        "x ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Acme",
                        ),
                      ),
                      Text(
                        widget.quanNumber.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Acme",
                        ),
                      ),
                    ],
                  ),

                  //price
                  Row(
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        "₹ ",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(widget.model!.price.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
