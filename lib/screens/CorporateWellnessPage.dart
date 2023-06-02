import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CorporateWellnessPage extends StatefulWidget {
  const CorporateWellnessPage({Key? key}) : super(key: key);

  @override
  State<CorporateWellnessPage> createState() => _CorporateWellnessPageState();
}

class _CorporateWellnessPageState extends State<CorporateWellnessPage> {
  Color scaffoldColor = const Color.fromRGBO(252, 251, 254, 1);
  Color bottomSheetColor = const Color.fromRGBO(45, 43, 78, 1);
  List<Map<String, dynamic>> yourProgress = [
    {
      "backgroundColor": const Color.fromRGBO(245, 108, 97, 1),
      "textColor": const Color.fromRGBO(253, 196, 193, 1.0),
      "name": "Working Hours",
      "subname": "Working Hours exceeded by 3 hours",
      "progress": "19/40"
    },
    {
      "backgroundColor": const Color.fromRGBO(255, 212, 101, 1),
      "textColor": const Color.fromRGBO(169, 128, 42, 1),
      "name": "Your Efficiency",
      "subname": "Excellent result",
      "progress": "82%"
    },
    {
      "backgroundColor": const Color.fromRGBO(255, 212, 101, 1),
      "textColor": const Color.fromRGBO(169, 128, 42, 1),
      "name": "Your Efficiency",
      "subname": "Excellent result",
      "progress": "53%"
    },
  ];
  List<dynamic> timeLines = List.generate(4, (index) => index);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              right: 0,
              left: 0,
              top: 0,
              child: Container(
                width: _size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hello, Villie!",
                            style: TextStyle(
                                fontSize: _size.aspectRatio * 70,
                                fontWeight: FontWeight.w900,
                                color: bottomSheetColor),
                          ),
                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(243, 245, 247, 1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(_size.width)),
                              border: Border.all(
                                color: const Color.fromRGBO(210, 208, 219, 1),
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/anonimous-user.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: _size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Your progress",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: bottomSheetColor,
                          fontSize: _size.aspectRatio * 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: _size.width,
                      height: _size.height * .33,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: PageView.builder(
                        controller: PageController(
                            viewportFraction: .45, initialPage: 0),
                        itemCount: yourProgress.length,
                        padEnds: false,
                        itemBuilder: (context, index) => CardWidget(
                          item: yourProgress[index],
                          index: index,
                        ),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Container(
                      width: _size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Wednesday, March 7",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: bottomSheetColor,
                                fontSize: _size.aspectRatio * 50,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 10),
                            decoration: ShapeDecoration(
                              color: const Color.fromRGBO(225, 224, 231, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.calendar_month,
                              color: bottomSheetColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...timeLines
                              .map(
                                (e) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "10:00 AM",
                                        style: TextStyle(
                                          color: bottomSheetColor,
                                          fontSize: _size.aspectRatio * 30,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: _size.width,
                                          padding: const EdgeInsets.all(10.0),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: ShapeDecoration(
                                            color: const Color.fromRGBO(
                                              254,
                                              226,
                                              231,
                                              1,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Meeting with front-end developers",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize:
                                                        _size.aspectRatio * 25),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Text(
                                                  "Flose Real Estate Project",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        _size.aspectRatio * 22,
                                                  ),
                                                ),
                                              ),
                                                Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                      "assets/images/anonimous-user.png",
                                                    ),
                                                  ),
                                                  Transform.translate(
                                                    offset: Offset(-10, 0),
                                                    child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                        "assets/images/anonimous-user.png",
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: BottomNavigationSheet(bottomSheetColor: bottomSheetColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _timeLineItem(e, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "10:00 AM",
          style: TextStyle(
            color: bottomSheetColor,
            fontSize: size.aspectRatio * 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: ShapeDecoration(
            color: const Color.fromRGBO(254, 226, 231, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Column(
            children: [
              Text("Meeting with front-end developers"),
              Text("Flose Real Estate Project"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("9:50 AM - 10:50 AM"),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final int index;

  final Map<String, dynamic> item;

  const CardWidget({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Transform.translate(
      offset: Offset(0, index == 0 ? -4 : 13),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(
          left: 20,
          top: 10,
          bottom: 20,
          right: 0,
        ),
        decoration: BoxDecoration(
            color: item["backgroundColor"],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: (item["backgroundColor"] as Color).withOpacity(.3),
                blurRadius: 10,
                spreadRadius: 4,
                offset: const Offset(5, 5),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: _size.width / 5.5,
              height: _size.width / 5.5,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                    color: item["textColor"],
                    width: 5,
                  ),
                ),
              ),
              child: Text(
                "${item['progress']}",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: item["textColor"],
                    fontSize: _size.aspectRatio * 35),
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "${item['name']}",
                maxLines: 2,
                style: TextStyle(
                  color: item["textColor"],
                  fontWeight: FontWeight.w700,
                  fontSize: _size.aspectRatio * 33,
                ),
              ),
            ),
            Text(
              "${item['subname']}",
              maxLines: 2,
              style: TextStyle(
                color: (item["textColor"] as Color).withOpacity(.8),
                fontWeight: FontWeight.w600,
                fontSize: _size.aspectRatio * 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationSheet extends StatelessWidget {
  const BottomNavigationSheet({
    super.key,
    required this.bottomSheetColor,
  });

  final Color bottomSheetColor;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: bottomSheetColor,
          borderRadius: BorderRadius.all(Radius.circular(_size.width))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.square_grid_2x2,
            color: Colors.white,
            size: 25,
            fill: 1,
          ),
          Icon(
            CupertinoIcons.app,
            color: Colors.white24,
            size: 25,
            fill: 1,
          ),
          Icon(
            CupertinoIcons.calendar,
            color: Colors.white24,
            size: 25,
            fill: 1,
          ),
          Icon(
            CupertinoIcons.chat_bubble,
            color: Colors.white24,
            size: 25,
            fill: 1,
          ),
          Icon(
            CupertinoIcons.settings,
            color: Colors.white24,
            size: 25,
            fill: 1,
          ),
        ],
      ),
    );
  }
}
