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

class SupDet2 extends StatefulWidget {
  const SupDet2({Key? key}) : super(key: key);

  @override
  _SupDet2State createState() => _SupDet2State();
}

class _SupDet2State extends State<SupDet2> {
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
            AppBarr(text: ("3 Months".tr())),
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
                    ? subscriptionsPrices[2]["price".tr()].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["destination".tr()].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["tripPrice".tr()].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["discount".tr()].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[2]["price".tr()].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[2]["subId".tr()].toString());
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
                    ? subscriptionsPrices[3]["price".tr()].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["destination".tr()].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["tripPrice".tr()].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["discount".tr()].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[3]["price".tr()].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[3]["subId".tr()].toString());
              },
            )
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
        .collection('Quarterly'.tr());

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
