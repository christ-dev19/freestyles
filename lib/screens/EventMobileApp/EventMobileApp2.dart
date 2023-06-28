
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freestyles/core/AppRouting.dart';
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

  List descriptions = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
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
              child: Container(
                width: size.width,
                height: size.height / 1.6,
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
            ),
            Positioned.fill(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromRGBO(42, 16, 11, 1),
                      Color.fromRGBO(16, 3, 3, 1.0),
                      // Colors.black
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              left: 0,
              right: 0,
              top: size.height / 2.1,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Oliver Tree',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: YsabeauInfant,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Jakarta Indonesia Concert',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(size.width),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              numberFormat.format(45.90),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat.d().format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    DateFormat.MMMM().format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Colors.white30,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat.EEEE().format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    "${DateFormat.Hm().format(
                                        DateTime.now())} - End",
                                    style: const TextStyle(
                                      color: Colors.white30,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white30,
                              ),
                              child: const Icon(
                                CupertinoIcons.calendar_today,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        text: const TextSpan(
                          text: "About this events : ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          children: [
                            TextSpan(
                              text:
                              "When the concert Oliver Tree will be on stage in 10:00. List of songs: Forget It, When I'm Down, All That and Life Goes On which will be sung on the Bung Karno surge stage.",
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  SizedBox(width: 5),
                                  Text(
                                    "4,8",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...descriptions.map((e) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                size: 20,
                                color: Colors.white30,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Oliver Tree singing is Dec 29th at 10:00 PM",
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
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
                        color: Colors.white30,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouting.eventMobileApp1);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                    const Text(
                      'Oliver Tree',
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
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  // color: Color.fromRGBO(16, 3, 3, .6),
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
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white38,
                      ),
                      child: const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()=>Navigator.pushNamed(
                            context, AppRouting.eventMobileApp3),
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
}
