import 'package:flutter/material.dart';
import 'package:users_app/assistantMethods/address_changer.dart';
import 'package:users_app/mainScreens/placed_order_screen.dart';
import 'package:users_app/maps/maps.dart';
import 'package:users_app/models/address.dart';
import 'package:provider/provider.dart';


class AddressDesign extends StatefulWidget {
  final Address? model;
  final int? currentIndex;
  final int? value;
  final String? addressID;
  final double? totalAmount;
  final String? sellerUID;

  AddressDesign({
    this.model,
    this.currentIndex,
    this.value,
    this.addressID,
    this.totalAmount,
    this.sellerUID,
  });

  @override
  _AddressDesignState createState() => _AddressDesignState();
}

class _AddressDesignState extends State<AddressDesign> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //select this address
        Provider.of<AddressChanger>(context, listen: false)
            .displayResult(widget.value);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          margin: EdgeInsets.only(top: 0, left: 15, right: 15),
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                //address info
                Row(
                  children: [
                    Radio(
                      groupValue: widget.currentIndex!,
                      value: widget.value!,
                      activeColor: Color(0xffc3b091),
                      onChanged: (val) {
                        //provider
                        Provider.of<AddressChanger>(context, listen: false)
                            .displayResult(val);
                        print(val);
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  const Text(
                                    "Name: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter"),
                                  ),
                                  Text(
                                    widget.model!.name.toString(),
                                    style: TextStyle(fontFamily: "Inter"),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    "Phone Number: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter"),
                                  ),
                                  Text(
                                    widget.model!.phoneNumber.toString(),
                                    style: TextStyle(fontFamily: "Inter"),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    "Flat Number: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter"),
                                  ),
                                  Text(
                                    widget.model!.flatNumber.toString(),
                                    style: TextStyle(fontFamily: "Inter"),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    "City: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter"),
                                  ),
                                  Text(
                                    widget.model!.city.toString(),
                                    style: TextStyle(fontFamily: "Inter"),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    "State: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter"),
                                  ),
                                  Text(
                                    widget.model!.state.toString(),
                                    style: TextStyle(fontFamily: "Inter"),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    "Full Address: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter"),
                                  ),
                                  Text(
                                    widget.model!.fullAddress.toString(),
                                    style: TextStyle(fontFamily: "Inter"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //button
                widget.value == Provider.of<AddressChanger>(context).count
                    ? ElevatedButton(
                        child: const Text(
                          "Proceed",
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffc3b091),
                            textStyle: TextStyle(color: Colors.black)),
                        onPressed: () {
                          // payment();
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (c)=> PlacedOrderScreen(
                                addressID: widget.addressID,
                                totalAmount: widget.totalAmount,
                                sellerUID: widget.sellerUID,
                              )
                          )
                          );
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
