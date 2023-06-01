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
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
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
                        child: Text(
                          "Your progress",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: bottomSheetColor,
                            fontSize: _size.aspectRatio * 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: bottomSheetColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(_size.width))),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
