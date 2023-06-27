import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/constants.dart';

Color colorChocolat = const Color.fromRGBO(64, 22, 14, 1);
Color redColor = const Color.fromRGBO(255, 70, 85, 1);

class EventMobileApp2 extends StatefulWidget {
  const EventMobileApp2({super.key});

  @override
  State<EventMobileApp2> createState() => _EventMobileApp2State();
}

class _EventMobileApp2State extends State<EventMobileApp2> {
  NumberFormat numberFormat = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: colorChocolat,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height / 2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/EventMobileApp/corporate_event.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              left: 0,
              right: 0,
              top: 0,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          colorChocolat,
                          Colors.black12,
                        ],
                      ),
                    ),
                  ),
                ],
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
                        color: Colors.white30,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                    const Text(
                      'Oliver Tree',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: YsabeauInfant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
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
              bottom: 30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white30,
                    ),
                    child: const Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width),
                        color: redColor,
                      ),
                      child: const Text(
                        'Get a Ticket',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
