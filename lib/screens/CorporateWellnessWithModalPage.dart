import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math.dart' as vm;

class CorporateWellnessWithModalPage extends StatefulWidget {
  const CorporateWellnessWithModalPage({Key? key}) : super(key: key);

  @override
  State<CorporateWellnessWithModalPage> createState() =>
      _CorporateWellnessWithModalPageState();
}

class _CorporateWellnessWithModalPageState
    extends State<CorporateWellnessWithModalPage> {
  Color scaffoldColor = const Color.fromRGBO(252, 251, 254, 1);
  Color bottomSheetColor = const Color.fromRGBO(45, 43, 78, 1);
  List<Map<String, dynamic>> yourProgress = [
    {
      "backgroundColor": const Color.fromRGBO(245, 108, 97, 1),
      "textColor": const Color.fromRGBO(253, 196, 193, 1.0),
      "name": "Working Hours",
      "surname": "Working Hours exceeded by 3 hours",
      "progress": "19/40",
      "degreeProgress": 190.0,
    },
    {
      "backgroundColor": const Color.fromRGBO(255, 212, 101, 1),
      "textColor": const Color.fromRGBO(169, 128, 42, 1),
      "name": "Your Efficiency",
      "surname": "Excellent result",
      "progress": "82%",
      "degreeProgress": 300.0,
    },
    {
      "backgroundColor": const Color.fromRGBO(255, 212, 101, 1),
      "textColor": const Color.fromRGBO(169, 128, 42, 1),
      "name": "Your Efficiency",
      "surname": "Excellent result",
      "progress": "53%",
      "degreeProgress": 300.0,
    },
  ];
  List<Map<String, dynamic>> timeLines = [
    {
      "title": "Meeting with front-end developers",
      "subTitle": "Flose Real Estate Profect",
      "time": "10:00 AM",
      "crenaux": "09-50 AM - 10-50 AM",
      "color": const Color.fromRGBO(254, 226, 231, 1),
      "colorText": const Color.fromRGBO(144, 81, 94, 1),
      "usersImage": [
        "assets/images/unsplash02.jpg",
        "assets/images/unsplash01.jpg",
        "assets/images/unsplash03.jpg",
      ]
    },
    {
      "title": "Internal marketing session",
      "subTitle": "Marketing Department",
      "time": "11:00 AM",
      "crenaux": "11-00 AM - 12-50 AM",
      "color": const Color.fromRGBO(231, 229, 241, 1),
      "colorText": const Color.fromRGBO(83, 80, 116, 1),
      "usersImage": [
        "assets/images/unsplash03.jpg",
        "assets/images/unsplash01.jpg",
        "assets/images/unsplash02.jpg",
      ]
    },
    {
      "title": "Internal marketing session",
      "subTitle": "Marketing Department",
      "time": "11:00 AM",
      "crenaux": "11-00 AM - 12-50 AM",
      "color": const Color.fromRGBO(237, 192, 187, 1),
      "colorText": const Color.fromRGBO(171, 122, 114, 1.0),
      "usersImage": [
        "assets/images/unsplash02.jpg",
        "assets/images/unsplash01.jpg",
        "assets/images/unsplash03.jpg",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const overlayColorModal = Color.fromRGBO(157, 156, 163, .3);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
         statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                right: 0,
                left: 0,
                top: 0,
                bottom: kBottomNavigationBarHeight + 10,
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
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
                              "Hello, Ville!",
                              style: TextStyle(
                                  fontSize: size.aspectRatio * 70,
                                  fontWeight: FontWeight.w900,
                                  color: bottomSheetColor),
                            ),
                            Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(243, 245, 247, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.width),
                                ),
                                border: Border.all(
                                  color: const Color.fromRGBO(210, 208, 219, 1),
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/unsplash02.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Your progress",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: bottomSheetColor,
                            fontSize: size.aspectRatio * 50,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * .33,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: PageView.builder(
                          controller: PageController(
                            viewportFraction: .45,
                            initialPage: 0,
                          ),
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
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 10),
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
                                  fontSize: size.aspectRatio * 50,
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                                    (e) => TimeLineWidget(
                                      bottomSheetColor: bottomSheetColor,
                                      item: e,
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                child: Container(
                  color: overlayColorModal,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 10,
                left: 10,
                child: BottomNavigationSheet(
                  bottomSheetColor: bottomSheetColor,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.fastEaseInToSlowEaseOut,
                right: 20,
                bottom: 30,
                left: 20,
                top: size.height / 3.5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: ShapeDecoration(
                            color: overlayColorModal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.close,
                              color: bottomSheetColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/i01.png"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Oh, you need \nsome rest !',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: bottomSheetColor,
                            fontWeight: FontWeight.w900,
                            fontSize: size.aspectRatio * 50,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Text(
                          "Coffee machine can make a cappuccino especially for vou in 5 minutes Do vou want some coffee ?",
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: bottomSheetColor.withOpacity(.5),
                            fontWeight: FontWeight.w700,
                            fontSize: size.aspectRatio * 30,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: bottomSheetColor,
                                  width: 3,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Text('No, latter',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: bottomSheetColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: size.aspectRatio * 25,
                                  )),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 212, 101, 1),
                                borderRadius: BorderRadius.circular(15),
                                shape: BoxShape.rectangle,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 4,
                                    offset: Offset(5, 5),
                                    color: Color.fromRGBO(255, 212, 101, .3),
                                  )
                                ],
                              ),
                              child: Text(
                                'Yes, thanks!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromRGBO(169, 128, 42, 1),
                                  fontWeight: FontWeight.w900,
                                  fontSize: size.aspectRatio * 25,
                                ),
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
      ),
    );
  }
}

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    super.key,
    required this.bottomSheetColor,
    required this.item,
  });

  final Color bottomSheetColor;
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${item['time']}",
            style: TextStyle(
              color: bottomSheetColor,
              fontSize: size.aspectRatio * 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Flexible(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: item['color'],
                borderRadius: BorderRadius.circular(15),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item['title']}",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: item['colorText'],
                        fontSize: size.aspectRatio * 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "${item['subTitle']}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: (item['colorText'] as Color).withOpacity(.8),
                        fontSize: size.aspectRatio * 22,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            minHeight: 40, maxWidth: size.width / 3),
                        height: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ...(item['usersImage'] as List<String>)
                                .asMap()
                                .entries
                                .map(
                                  (el) => Positioned(
                                    left: (20 * el.key).toDouble(),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          (item['colorText'] as Color),
                                      backgroundImage: AssetImage(
                                        el.value,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                      Flexible(
                          child: Text(
                        '${item['crenaux']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: (item['colorText'] as Color).withOpacity(.8),
                          fontSize: size.aspectRatio * 20,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color color;
  final double degreeProgress;

  MyPainter({required this.color, required this.degreeProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;
    final radius = w / 2;
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(w / 2, h / 2);
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(
        rect, vm.radians(-90), vm.radians(degreeProgress), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class CardWidget extends StatelessWidget {
  final int index;

  final Map<String, dynamic> item;

  const CardWidget({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            CustomPaint(
              painter: MyPainter(
                  color: item["textColor"],
                  degreeProgress: item['degreeProgress']),
              child: Container(
                width: size.width / 5.5,
                height: size.width / 5.5,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Text(
                  "${item['progress']}",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: item["textColor"],
                      fontSize: size.aspectRatio * 35),
                ),
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
                  fontSize: size.aspectRatio * 33,
                ),
              ),
            ),
            Text(
              "${item['surname']}",
              maxLines: 2,
              style: TextStyle(
                color: (item["textColor"] as Color).withOpacity(.8),
                fontWeight: FontWeight.w600,
                fontSize: size.aspectRatio * 25,
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
    this.onPressedIcon,
  });

  final Color bottomSheetColor;
  final VoidCallback? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: bottomSheetColor,
          borderRadius: BorderRadius.all(Radius.circular(size.width))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPressedIcon,
            icon: const Icon(
              CupertinoIcons.square_grid_2x2,
              color: Colors.white,
              size: 25,
              fill: 1,
            ),
          ),
          const Icon(
            CupertinoIcons.app,
            color: Colors.white24,
            size: 25,
            fill: 1,
          ),
          const Icon(
            CupertinoIcons.calendar,
            color: Colors.white24,
            size: 25,
            fill: 1,
          ),
          const Icon(
            CupertinoIcons.chat_bubble,
            color: Colors.white24,
            size: 25,
            fill: 1,
          ),
          const Icon(
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
