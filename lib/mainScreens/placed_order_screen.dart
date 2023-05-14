

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_app/assistantMethods/assistant_methods.dart';
import 'package:users_app/global/global.dart';

import 'package:users_app/widgets/error_dialog.dart';
import 'home_screen.dart';

class PlacedOrderScreen extends StatefulWidget {
  String? addressID;
  double? totalAmount;
  String? sellerUID;

  PlacedOrderScreen({this.sellerUID, this.totalAmount, this.addressID});

  @override
  _PlacedOrderScreenState createState() => _PlacedOrderScreenState();
}

class _PlacedOrderScreenState extends State<PlacedOrderScreen> {
  String orderId = DateTime.now().millisecondsSinceEpoch.toString();
  // Map<String, dynamic>? paymentIntent;

  addOrderDetails() {
    writeOrderDetailsForUser({
      "addressID": widget.addressID,
      "totalAmount": widget.totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productIDs": sharedPreferences!.getStringList("userCart"),
      "paymentDetails": "Cash on Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    });

    writeOrderDetailsForSeller({
      "addressID": widget.addressID,
      "totalAmount": widget.totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productIDs": sharedPreferences!.getStringList("userCart"),
      "paymentDetails": "Cash on Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    }).whenComplete(() {
      clearCartNow(context);
      setState(() {
        orderId = "";
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        Fluttertoast.showToast(
            msg: "Congratulations, Order has been placed successfully.");
      });
    });
  }

  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(sharedPreferences!.getString("uid"))
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  Future writeOrderDetailsForSeller(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  // Future<void> payment() async {
  //   try {
  //     Map<String,dynamic> body ={
  //       'amount':10000,
  //       'currency':"INR",
  //     };
  //
  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       headers:{
  //         'Authorization':'Bearer',
  //         'Content-type':'applications/x-www-form-urlencoded',
  //       },
  //
  //     );
  //
  //     paymentIntent=json.decode(response.body);
  //
  //   } catch (error) {
  //     throw Exception(error);
  //   }
  //
  //   await Stripe.instance.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
  //     paymentIntentClientSecret: paymentIntent!['client-secret'],
  //     style: ThemeMode.light,
  //     merchantDisplayName: 'Samosa Squad',
  //
  //   )).then((value)=>{});
  //
  //
  //   try{
  //
  //   }catch(error){
  //     await Stripe.instance.presentPaymentSheet().then((value)=>{
  //       print("Payment success!!"),
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffebf0f6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: ClipRRect(child: Image.asset("images/delivery.jpg"),borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text("Place Order",style: TextStyle(fontSize: 20),),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffc3b091),
                  ),
                  onPressed: () {

                      addOrderDetails();

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
