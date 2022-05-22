import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_auth.dart';
import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/Expandable.dart';
import '../../widget/botom Bar.dart';

class SupDet3 extends StatefulWidget {
  const SupDet3({Key? key}) : super(key: key);

  @override
  _SupDet3State createState() => _SupDet3State();
}

class _SupDet3State extends State<SupDet3> {
  String uid = "";
  List<Map<String, Object>> subscriptionsPrices = <Map<String, Object>>[];

  @override
  void initState() {
    super.initState();
    getUser();
    getSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BotoomBar(
        index: 1,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            AppBarr(text: ("Yearly".tr())),
            SizedBox(
              height: 40,
            ),
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["price".tr()].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["destination".tr()].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["tripPrice".tr()].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["discount".tr()].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[0]["price".tr()].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[0]["subId".tr()].toString());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: ColorsHelp.background,
            ),
            SizedBox(
              height: 20,
            ),
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["price".tr()].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["destination".tr()].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["tripPrice".tr()].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["discount".tr()].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[1]["price".tr()].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[1]["subId".tr()].toString());
              },
            ),
            /*SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: ColorsHelp.background,
            ),
            SizedBox(
              height: 20,
            ),
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["price"].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["destination"].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["tripPrice"].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["discount"].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[2]["price"].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[2]["subId"].toString());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: ColorsHelp.background,
            ),
            SizedBox(
              height: 20,
            ),
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["price"].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["destination"].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["tripPrice"].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["discount"].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[3]["price"].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[3]["subId"].toString());
              },
            )*/
          ],
        ),
      ),
    );
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      uid = prefs.getString("uid") ?? "";
      log("uid: $uid}");
    });
    //return User(uid: "",email: email ,name: name, phone: phone, tagID: tagID, nationalID: nationalID);
  }

  Future<void> getSubscriptions() async {
    CollectionReference monthlyReference = FirebaseFirestore.instance
        .collection('Subscriptions_prices'.tr())
        .doc('ZZ9xxdI0g0FkRbbnlvXl')
        .collection('Annually'.tr());

    await monthlyReference.orderBy("order".tr()).get().then((value) {
      value.docs.forEach((result) {
        //print(result.data());
        /*addSub(
            destination: result.get("destination"),
            order: result.get("order"),
            discount: result.get("discount"),
            price: result.get("price"),
            tripPrice: result.get("tripPrice"));*/
        setState(() {
          subscriptionsPrices.add({
            "subId".tr(): result.id,
            "destination".tr(): result.get("destination".tr()),
            "price".tr(): result.get("price".tr()),
            "tripPrice".tr(): result.get("tripPrice".tr()),
            "discount".tr(): result.get("discount".tr())
          });
          //ticketPrices.add({"price": result.get("price")});

          print(subscriptionsPrices);
        });
      });

      //print(ticketPrices[0]['price']);
    });
  }
}
