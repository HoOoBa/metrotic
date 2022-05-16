import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../helper.dart';
import '../widget/botom Bar.dart';
import 'menu.dart';

class Notif extends StatelessWidget {
  final bool? isBooking;
  final bool? isExpired;
  final bool? isPurchased;
  final bool? isLogin;
  Notif(
      {this.isBooking = false,
      this.isExpired = false,
      this.isPurchased = false,
      this.isLogin = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 4,
        ),
        body: SafeArea(
          child: ListView(children: [
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.green,
                            size: 30,
                          )),
                      Text(
                        "Notification".tr(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsHelp.background),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Menu()));
                        },
                        child: Image.asset(
                          "assets/menu.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                color: const Color(0xff00334a),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      isLogin!
                          ? Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications_active,
                                      color: Colors.green,
                                      size: 40,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'You have been successfully logged in',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                    height: 1.5294117647058822,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                )
                              ],
                            )
                          : Container(),
                      isBooking!
                          ? Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications_active,
                                      color: Colors.green,
                                      size: 40,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'your ticket has been booked \nsuccessfully'
                                      .tr(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                    height: 1.5294117647058822,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                )
                              ],
                            )
                          : Container(),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Divider(
                      //   color: Colors.white,
                      //   thickness: 2,
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(
                      //           Icons.notifications_active,
                      //           color: Colors.green,
                      //           size: 40,
                      //         )),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //       'your ticket has been booked \nsuccessfully'.tr(),
                      //       style: TextStyle(
                      //         fontFamily: 'Montserrat',
                      //         fontSize: 15,
                      //         color: const Color(0xffffffff),
                      //         fontWeight: FontWeight.w500,
                      //         height: 1.5294117647058822,
                      //       ),
                      //       textHeightBehavior:
                      //           TextHeightBehavior(applyHeightToFirstAscent: false),
                      //       softWrap: false,
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Divider(
                      //   color: Colors.white,
                      //   thickness: 2,
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      isExpired!
                          ? Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications_active,
                                      color: Colors.green,
                                      size: 40,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'your ticket has been Expired'.tr(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                    height: 1.5294117647058822,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                )
                              ],
                            )
                          : Container(),

                      isPurchased!
                          ? Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications_active,
                                      color: Colors.green,
                                      size: 40,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'your ticket has been purchased'.tr(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                    height: 1.5294117647058822,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                )
                              ],
                            )
                          : Container(),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Divider(
                      //   color: Colors.white,
                      //   thickness: 2,
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(
                      //           Icons.notifications_active,
                      //           color: Colors.white,
                      //           size: 40,
                      //         )),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //       'your ticket has been booked \nsuccessfully'.tr(),
                      //       style: TextStyle(
                      //         fontFamily: 'Montserrat',
                      //         fontSize: 15,
                      //         color: const Color(0xffffffff),
                      //         fontWeight: FontWeight.w500,
                      //         height: 1.5294117647058822,
                      //       ),
                      //       textHeightBehavior:
                      //           TextHeightBehavior(applyHeightToFirstAscent: false),
                      //       softWrap: false,
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Divider(
                      //   color: Colors.white,
                      //   thickness: 2,
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(
                      //           Icons.notifications_active,
                      //           color: Colors.white,
                      //           size: 40,
                      //         )),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //       'your ticket has been booked \nsuccessfully'.tr(),
                      //       style: TextStyle(
                      //         fontFamily: 'Montserrat',
                      //         fontSize: 15,
                      //         color: const Color(0xffffffff),
                      //         fontWeight: FontWeight.w500,
                      //         height: 1.5294117647058822,
                      //       ),
                      //       textHeightBehavior:
                      //           TextHeightBehavior(applyHeightToFirstAscent: false),
                      //       softWrap: false,
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Divider(
                      //   color: Colors.white,
                      //   thickness: 2,
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(
                      //           Icons.notifications_active,
                      //           color: Colors.white,
                      //           size: 40,
                      //         )),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //       'your ticket has been Expired'.tr(),
                      //       style: TextStyle(
                      //         fontFamily: 'Montserrat',
                      //         fontSize: 15,
                      //         color: const Color(0xffffffff),
                      //         fontWeight: FontWeight.w500,
                      //         height: 1.5294117647058822,
                      //       ),
                      //       textHeightBehavior:
                      //           TextHeightBehavior(applyHeightToFirstAscent: false),
                      //       softWrap: false,
                      //     )
                      //   ],
                      // )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
