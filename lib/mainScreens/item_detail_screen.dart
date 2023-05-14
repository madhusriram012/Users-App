import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_app/assistantMethods/assistant_methods.dart';
import 'package:users_app/models/items.dart';
import 'package:users_app/widgets/app_bar.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class ItemDetailsScreen extends StatefulWidget {
  final Items? model;
  ItemDetailsScreen({this.model});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  TextEditingController counterTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.model!.sellerUID),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
              widget.model!.thumbnailUrl.toString(),
                      height: 220.0,
                      fit: BoxFit.cover,
                      width: 320,
            ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.model!.title.toString()+ " - ₹" + widget.model!.price.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.model!.longDescription.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: NumberInputPrefabbed.roundedButtons(
                controller: counterTextEditingController,
                incDecBgColor: Colors.grey,
                min: 1,
                max: 9,
                initialValue: 1,
                buttonArrangement: ButtonArrangement.incRightDecLeft,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  int itemCounter =
                      int.parse(counterTextEditingController.text);

                  List<String> separateItemIDsList = separateItemIDs();

                  //1.check if item exist already in cart
                  separateItemIDsList.contains(widget.model!.itemID)
                      ? Fluttertoast.showToast(msg: "Item is already in Cart.")
                      :
                      //2.add to cart
                      addItemToCart(widget.model!.itemID, context, itemCounter);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color:  Color(0xffc3b091),
                    ),
                    width: MediaQuery.of(context).size.width - 130,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
