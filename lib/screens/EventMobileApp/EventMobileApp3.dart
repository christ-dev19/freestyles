import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freestyles/core/AppRouting.dart';
import 'package:intl/intl.dart';

import '../../core/constants.dart';

Color colorChocolat = const Color.fromRGBO(64, 22, 14, 1);
Color redColor = const Color.fromRGBO(255, 70, 85, 1);

class EventMobileApp3 extends StatefulWidget {
  const EventMobileApp3({super.key});

  @override
  State<EventMobileApp3> createState() => _EventMobileApp3State();
}

class _EventMobileApp3State extends State<EventMobileApp3> {
  NumberFormat numberFormat = NumberFormat.simpleCurrency();

  List descriptions = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: colorChocolat,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: colorChocolat,
        body: Stack(
          children: [
            Positioned.fill(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorChocolat,
                      colorChocolat,
                      const Color.fromRGBO(16, 3, 3, 1.0),
                      // Colors.black
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              left: 20,
              right: 20,
              top: size.height / 7,
              bottom: size.height / 7,
              child: Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.width / 2,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/EventMobileApp/2145901611_small_1.jpg',
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black38,
                            Colors.black12.withOpacity(.1),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              blurStyle: BlurStyle.inner)
                        ],
                        borderRadius:
                            BorderRadius.all(Radius.circular(size.width)),
                      ),
                    ),
                    Expanded(
                      child: Transform.translate(
                        offset: const Offset(0, -5),
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Oliver Tree Convert: Indonesia ${DateFormat("dd MMMM yyyy").format(DateTime.now())}",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buildItemTicket(
                                    label: "Date",
                                    value: DateFormat("MMM dd, yyyy")
                                        .format(DateTime.now()),
                                  ),
                                  _buildItemTicket(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    label: "Time",
                                    value: DateFormat("HH:mm")
                                        .format(DateTime.now()),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buildItemTicket(
                                    label: "Venue",
                                    value: "Gelora Bung kano",
                                  ),
                                  _buildItemTicket(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    label: "Seat",
                                    value: "No seat",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: size.width,
                                height: size.width / 9,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/EventMobileApp/pngtree-barcode-with-no-background-png-image_6557931.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white12,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                    const Text(
                      'Tickets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: YsabeauInfant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white12,
                      ),
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black87,
                      Color.fromRGBO(16, 3, 3, .3),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width),
                          color: redColor,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.cloud_download,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Image',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width),
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.qrcode,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Qr Code',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildItemTicket({
    required String label,
    required String value,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black38, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 7),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
