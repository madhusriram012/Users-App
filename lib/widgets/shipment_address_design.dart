import 'package:flutter/material.dart';
import 'package:users_app/mainScreens/home_screen.dart';
import 'package:users_app/models/address.dart';
import 'package:users_app/splashScreen/splash_screen.dart';

class ShipmentAddressDesign extends StatelessWidget
{
  final Address? model;

  ShipmentAddressDesign({this.model});



  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
                'Shipping Details:',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            ),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 5,right: 5),
              color:Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(model!.name!,style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(model!.phoneNumber!,style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text(
                        "Address",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(model!.fullAddress!,style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Text(
        //     model!.fullAddress!,
        //     textAlign: TextAlign.justify,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: InkWell(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MySplashScreen()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffc3b091),
                  ),
                  width: MediaQuery.of(context).size.width - 120,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Go Back",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
