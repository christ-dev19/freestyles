
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freestyles/core/AppRouting.dart';
import 'package:intl/intl.dart';

import '../../core/constants.dart';

Color colorChocolat = const Color.fromRGBO(64, 22, 14, 1);
Color redColor = const Color.fromRGBO(255, 70, 85, 1);

class EventMobileApp1 extends StatefulWidget {
  const EventMobileApp1({super.key});

  @override
  State<EventMobileApp1> createState() => _EventMobileApp1State();
}

class _EventMobileApp1State extends State<EventMobileApp1> {
  NumberFormat numberFormat = NumberFormat.simpleCurrency();

  List<dynamic> events = [
    {
      "date": DateTime.now(),
      "price": 45.90,
      "eventName": "Oliver Tree Concert",
      "name": "Jakarta Indonesia",
      "cover": "assets/images/EventMobileApp/events-1200x630.jpg"
    },
    {
      "date": DateTime.now().add(const Duration(days: 4)),
      "price": 50.30,
      "eventName": "Oliver Tree Concert",
      "name": "Jakarta Indonesia",
      "cover":
      "assets/images/EventMobileApp/pexels-andrea-piacquadio-787961.jpg"
    },
    {
      "date": DateTime.now().add(const Duration(days: 30)),
      "price": 10.40,
      "eventName": "Oliver Tree Concert",
      "name": "Jakarta Indonesia",
      "cover": "assets/images/EventMobileApp/pm_1024x1024.webp"
    },
  ];
  List<dynamic> menus = [
    {"selected": true, "icon": Icons.home_filled},
    {"selected": false, "icon": CupertinoIcons.suit_heart},
    {"selected": false, "icon": CupertinoIcons.video_camera},
    {"selected": false, "icon": CupertinoIcons.mail},
    {"selected": false, "icon": CupertinoIcons.person},
  ];
  List<dynamic> upcomingEvents = [
    {
      "id": DateTime.now().microsecond,
      "label": "My feed",
      "icon": Icons.flash_on,
    },
    {
      "id": DateTime.now().microsecond,
      "label": "Food",
      "icon": CupertinoIcons.arrow_up_arrow_down
    },
    {
      "id": DateTime.now().microsecond,
      "label": "Concerts",
      "icon": CupertinoIcons.music_note
    },
  ];

  dynamic upcomingEventsSelected;

  @override
  void initState() {
    upcomingEventsSelected = upcomingEvents[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorChocolat,
                colorChocolat,
                Colors.black12,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              margin: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white12,
                              ),
                              child: const Icon(
                                Icons.format_align_left_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.place_sharp,
                                    color: redColor, size: 20),
                                const SizedBox(width: 10),
                                const Text(
                                  'Jakarta, Ina',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: YsabeauInfant,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(18),
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: const Color.fromRGBO(95, 55, 46, 1),
                                    width: 3),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/EventMobileApp/icon-6007530_1280.webp"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: size.width,
                          padding: const EdgeInsets.all(3),
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(size.width),
                          ),
                          child:   TextField(
                            cursorColor: colorChocolat,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.black12,
                              prefixIcon: Icon(
                                CupertinoIcons.search,
                                size: 25,
                                color: Colors.white,
                              ),
                              hintText: "Search all event...",
                              hintStyle: TextStyle(
                                  fontFamily: YsabeauInfant,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white60),
                              suffixIcon: Icon(
                                CupertinoIcons.slider_horizontal_3,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Upcoming events",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: YsabeauInfant,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "See All",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: YsabeauInfant,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ...upcomingEvents
                                  .map(
                                    (item) =>
                                        _buildIconWidget(size, data: item),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          constraints: BoxConstraints(
                            minHeight: size.height / 1.7,
                            maxHeight: size.height / 1.6,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(
                            children: [
                              ...events
                                  .map((item) => _buildCardEvent(size, item))
                                  .toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...menus.asMap().entries.map((e) {
                        dynamic item = e.value;
                        return Flexible(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: CircleAvatar(
                              backgroundColor: item['selected']
                                  ? Colors.white
                                  : Colors.transparent,
                              radius: 25,
                              child: Icon(item['icon'],
                                  color: item['selected']
                                      ? redColor
                                      : Colors.white,
                                  size: 23),
                            ),
                            onPressed: () {
                              menus.map((e) => e['selected'] = false).toList();
                              item['selected'] = !item['selected'];
                              setState(() {});
                            },
                            color: redColor,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildCardEvent(Size size, item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouting.eventMobileApp2);
      },
      child: Container(
        width: size.width,
        height: size.height / 3.2,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage(item['cover']),
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.black45, BlendMode.srcATop)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade700.withOpacity(.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.d().format(item['date']),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: YsabeauInfant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      DateFormat.MMM().format(item['date']),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
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
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700.withOpacity(.8),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item['eventName']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: YsabeauInfant,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${item['name']} - ${DateFormat.Hm().format(item['date'])}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
                        numberFormat.format(item['price']),
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Flexible _buildIconWidget(Size size, {
    required data,
  }) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          upcomingEventsSelected = data;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: upcomingEventsSelected['id'] == data['id']
                ? redColor
                : Colors.white12,
            borderRadius: BorderRadius.circular(size.width),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Icon(
                  data['icon'],
                  size: 20,
                  color: upcomingEventsSelected['id'] == data['id']
                      ? redColor
                      : Colors.black,
                ),
              ),
              Expanded(
                child: Text(
                  data['label'],
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
